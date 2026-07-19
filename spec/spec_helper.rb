# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
  add_filter '/spec/'
  # Upstream gates at 100/100, measured on Ruby 3.3+. On Ruby 2.7.8 the
  # older stdlib json gem parses a few inputs differently, so a handful of
  # repair lines are unreachable and line coverage tops out around 99.4%.
  minimum_coverage line: 99, branch: 100
end

require 'json/repair'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
