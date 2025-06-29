require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation in non-test environments.
if !Rails.env.test?
  abort("The Rails environment is running in #{Rails.env} mode!")
end

require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each do |f|
  require f
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.filter_rails_from_backtrace!
  config.use_transactional_fixtures = true
end
