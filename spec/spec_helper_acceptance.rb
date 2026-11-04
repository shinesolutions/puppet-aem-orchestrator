require 'voxpupuli/acceptance/spec_helper_acceptance'

# configure_beaker installs the local module (and its metadata.json dependencies)
# on each host in before(:suite), then runs this block. The agent and the module's
# prerequisites (libxcrypt-compat, pip, Java 21) come from the nodesets' images
# (BEAKER_PUPPET_COLLECTION=preinstalled in the Makefile)
configure_beaker do |host|
  on host, 'pip3 install --upgrade awscli'

  # Configure AWS credentials from the placeholder file
  on host, 'install -o root -g root -m 0700 -d ~/.aws'
  scp_to host, File.join(__dir__, 'acceptance', 'aws_credentials'), '/root/.aws/credentials'
end
