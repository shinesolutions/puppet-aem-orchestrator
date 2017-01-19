require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

Rake::Task["default"].clear

task :default => [
    :syntax,
    :metadata_lint,
    :lint,
    :spec,
]
