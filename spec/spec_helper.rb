require "bundler/setup"
require "ds18b20"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def support_file_location(file_name)
  File.expand_path(File.join(File.dirname(__FILE__),"support/#{file_name}"),)
end
