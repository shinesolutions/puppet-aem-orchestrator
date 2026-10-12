source ENV['GEM_SOURCE'] || 'https://rubygems.org'

ruby '4.0.7'

def location_for(place_or_version, fake_version = nil)
  git_url_regex = %r{\A(?<url>(https?|git)[:@][^#]*)(#(?<branch>.*))?}
  file_url_regex = %r{\Afile:\/\/(?<path>.*)}

  if place_or_version && (git_url = place_or_version.match(git_url_regex))
    [fake_version, { git: git_url[:url], branch: git_url[:branch], require: false }].compact
  elsif place_or_version && (file_url = place_or_version.match(file_url_regex))
    ['>= 0', { path: File.expand_path(file_url[:path]), require: false }]
  else
    [place_or_version, { require: false }]
  end
end

group :development do
  # --- Standard Library Backports (Extracted in Ruby 3.4 / 4.0) ---
  gem "ostruct",    require: false
  gem "base64",     require: false
  gem "mutex_m",    require: false
  gem "drb",        require: false
  gem "bigdecimal", require: false
  gem "logger",     require: false
  gem "csv",        require: false
  gem "benchmark",  require: false

  # --- Pure-Ruby Faraday 2.x HTTP Stack ---
  gem "faraday",          "~> 2.12", require: false
  gem "faraday-net_http", "~> 3.4",  require: false

  # --- Miscellaneous Tooling ---
  gem "puppet-strings",              '~> 4.0',  require: false
  gem "github_changelog_generator", '~> 1.16', require: false
end

group :development, :test, :system_tests do
  gem 'json', '< 3.0.0'
  gem "voxpupuli-test", require: false
  gem "faraday-retry",  require: false
  gem 'rubocop-performance', require: false
  gem 'beaker-rspec'
  gem 'voxpupuli-acceptance'
end

puppet_version = ENV['PUPPET_GEM_VERSION']
facter_version = ENV['FACTER_GEM_VERSION']
hiera_version  = ENV['HIERA_GEM_VERSION']

gems = {}
gems['puppet'] = location_for(puppet_version) if puppet_version
gems['facter'] = location_for(facter_version) if facter_version
gems['hiera']  = location_for(hiera_version)  if hiera_version

gems.each do |gem_name, gem_params|
  gem gem_name, *gem_params
end

extra_gemfiles = [
  "#{__FILE__}.local",
  File.join(Dir.home, '.gemfile'),
]

extra_gemfiles.each do |gemfile|
  if File.file?(gemfile) && File.readable?(gemfile)
    eval(File.read(gemfile), binding)
  end
end