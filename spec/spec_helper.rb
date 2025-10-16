require_relative 'coverage_helper'
require 'dotenv'

# Use environment variables set in the CI/CD environment
if ENV['CI'].to_s != 'true'
  Dotenv.load('.env.test')
end

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  if config.files_to_run.one?
    config.default_formatter = :doc
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.example_status_persistence_file_path = 'tmp/rspec/examples.txt'
  config.filter_run_when_matching :focus
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups
  # config.profile_examples = 10

  Kernel.srand config.seed
end

RSpec::Matchers.define_negated_matcher :not_change, :change
