require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.default_facts = {
    osfamily: 'RedHat',
    operatingsystem: 'Centos',
    os: {
      name: 'CentOS',
      family: 'RedHat',
      release: {
        major: '7',
        minor: '2',
        full: '7.2.1511',
      }
    }
  }
end
