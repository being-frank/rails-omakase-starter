require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

return if !Rails.env.test?

require 'rspec/rails'

# Support files
require_relative 'support/active_job'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.filter_rails_from_backtrace!
  config.use_transactional_fixtures = true
  # config.use_transactional_fixtures = false # enable spec/support/database_cleaner.rb when `false`
end
