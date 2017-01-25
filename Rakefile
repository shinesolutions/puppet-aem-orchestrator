require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet_blacksmith/rake_tasks'
require 'voxpupuli/release/rake_tasks'
require 'puppet-strings/tasks'

if RUBY_VERSION >= '2.3.0'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new(:rubocop) do |task|
    # These make the rubocop experience maybe slightly less terrible
    task.options = ['-D', '-S', '-E']
  end
end

PuppetLint::RakeTask.new :lint do |config|
  config.log_format = "%{path}:%{line}:%{check} %{KIND} %{message}"
  config.fail_on_warnings = true
  config.relative = true
  config.with_context = true
end

exclude_paths = %w(
  pkg/**/*
  vendor/**/*
  .vendor/**/*
  spec/**/*
)
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

Rake::Task["default"].clear
desc 'Run tests metadata_lint, lint, syntax, spec'
task default: [
  :metadata_lint,
  :lint,
  :syntax,
  :spec,
]
# vim: syntax=ruby
