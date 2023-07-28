source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, fake_version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

group :test do
  gem 'puppet', '~> 7.18',                                          :require => false
  gem 'puppetlabs_spec_helper', '4.0.1',                            :require => false
  # gem 'rspec-puppet',                                               :require => false, :git => 'https://github.com/rodjek/rspec-puppet.git'
  # gem 'rspec-puppet-facts',                                         :require => false
  # gem 'rspec-puppet-utils',                                         :require => false
  gem 'puppet-lint', '2.5.2',                                       :require => false
  gem 'puppet-lint-param-docs',                                     :require => false
  gem 'puppet-lint-strict_indent-check',                            :require => false
  gem 'puppet-lint-absolute_classname-check',                       :require => false
  gem 'puppet-lint-leading_zero-check',                             :require => false
  gem 'puppet-lint-trailing_comma-check',                           :require => false
  gem 'puppet-lint-version_comparison-check',                       :require => false
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check',  :require => false
  gem 'puppet-lint-unquoted_string-check',                          :require => false
  gem 'puppet-lint-variable_contains_upcase',                       :require => false
  gem 'puppet-lint-resource_reference_syntax',                      :require => false
  gem 'puppet-lint-legacy_facts-check',                             :require => false
  gem 'puppet-lint-duplicate_class_parameters-check',               :require => false
  gem 'metadata-json-lint',                                         :require => false
  gem 'puppet-blacksmith',                                          :require => false
  gem 'voxpupuli-release', '2.0.0',                                 :require => false
  gem 'json_pure', '<= 2.0.1',                                      :require => false if RUBY_VERSION < '2.0.0'
  gem 'semantic_puppet',                                            :require => false
end

group :development do
  gem 'travis',                  :require => false
  gem 'travis-lint',             :require => false
  gem 'guard-rake',              :require => false
  gem 'puppet-strings',          :require => false
end
#
# group :system_tests do
#   if beaker_version = ENV['BEAKER_VERSION']
#     gem 'beaker', *location_for(beaker_version)
#   end
#   if beaker_rspec_version = ENV['BEAKER_RSPEC_VERSION']
#     gem 'beaker-rspec', *location_for(beaker_rspec_version)
#   else
#     gem 'beaker-rspec',  :require => false
#   end
#   gem 'beaker-puppet_install_helper',  :require => false
# end

# vim: syntax=ruby
