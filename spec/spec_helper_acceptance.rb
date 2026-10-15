require 'beaker_puppet_helpers'
require 'voxpupuli/acceptance/spec_helper_acceptance'

# beaker_puppet_helpers has no repo install step for Amazon Linux, although the
# OpenVox yum repo publishes <collection>-release-amazon-<version>.noarch.rpm
module AmazonReleaseRepo
  def install_puppet_release_repo_on(host, collection = 'puppet')
    variant, version, = host['packaging_platform'].split('-', 3)
    return super unless variant == 'amazon'

    repos = BeakerPuppetHelpers::InstallUtils::REPOS[implementation_from_collection(collection).to_sym][:release]
    host.install_package("#{repos[:yum]}/#{collection}-release-amazon-#{version}.noarch.rpm")
  end
end
BeakerPuppetHelpers::InstallUtils.singleton_class.prepend(AmazonReleaseRepo)

# configure_beaker installs the local module (and its metadata.json dependencies)
# on each host in before(:suite), then runs this block
configure_beaker do |host|
  # Supported platforms: Amazon Linux 2023 and Rocky Linux 10
  install_package(host, 'libxcrypt-compat')
  install_package(host, 'python3-pip')
  install_package(host, host['platform'].start_with?('amazon') ? 'java-21-amazon-corretto-headless' : 'java-21-openjdk-headless')

  on host, 'pip3 install --upgrade awscli'

  # Configure AWS credentials from the placeholder file
  on host, 'install -o root -g root -m 0700 -d ~/.aws'
  scp_to host, File.join(__dir__, 'acceptance', 'aws_credentials'), '/root/.aws/credentials'
end
