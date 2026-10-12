require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  # Install OS prerequisites dynamically based on host platform
  case host['platform']
  when %r{el-}, %r{centos}, %r{redhat}, %r{fedora}, %r{rocky}, %r{alma}
    install_package(host, 'libxcrypt-compat')
    install_package(host, 'epel-release') if host['platform'].include?('el-7')
    install_package(host, 'python3-pip')
    install_package(host, 'rsync')
  when %r{ubuntu}, %r{debian}
    install_package(host, 'python3-pip')
    install_package(host, 'rsync')
  end

  on host, 'pip3 install --upgrade awscli'

  # Configure AWS credentials and local module
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  on host, 'install -o root -g root -m 0700 -d ~/.aws'
  rsync_to host, File.join(proj_root, 'aws_credentials'), '~/.aws/credentials'

  # Install local module and Puppet/OpenVox module dependencies
  install_dev_puppet_module_on(host, source: proj_root, module_name: 'aem_orchestrator')
  on host, puppet('module', 'install', 'puppetlabs-java'), acceptable_exit_codes: [0, 1]
  on host, puppet('module', 'install', 'puppet-archive'), acceptable_exit_codes: [0, 1]

  apply_manifest_on(host, 'class { "java": distribution => "jre" }')
end
