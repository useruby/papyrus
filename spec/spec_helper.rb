$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'papyrus'
Bundler.require :development

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  # enable filtering for examples
  config.filter_run :wip => true
  config.run_all_when_everything_filtered = true
end

at_exit do
  if File.size? Papyrus::Settings.searchd_pid
    system "#{Papyrus::Settings.cmd} -c #{Papyrus::Settings.config_filename} --base_dir #{Papyrus::Settings::BASE_DIR} --stop"
  end
end
