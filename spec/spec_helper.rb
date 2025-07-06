require_relative 'support/coverage'

require 'dotenv'

# Load the Rails application
require_relative '../config/environment'

# Prevent database truncation if the environment is production
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

# Return early if not in test environment
return if !Rails.env.test?

# Require RSpec and other testing libraries
require 'rspec/rails'

# Use environment variables set in the CI/CD environment
if ENV['CI'].present?
  Dotenv.load('.env.test')
end

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
#
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.example_status_persistence_file_path = 'tmp/rspec/examples.txt'
  config.filter_run_when_matching :focus
  config.order = :random
  config.profile_examples = 10
  config.shared_context_metadata_behavior = :apply_to_host_groups

  Kernel.srand config.seed
end

RSpec::Matchers.define_negated_matcher :not_change, :change
