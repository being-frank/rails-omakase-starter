require 'single_cov'

SingleCov.setup(:rspec) if ARGV.grep(/spec\.rb/).any?
SingleCov::RAILS_APP_FOLDERS.push(*%w[
  facades
  frontend/components
  services
])
SingleCov.disable if ENV['CI'].to_s == 'true'

require 'simplecov'

SimpleCov.start 'rails' do
  command_name "Job #{ENV['TEST_ENV_NUMBER']}" if ENV.key?('TEST_ENV_NUMBER')

  add_filter 'lib/core_extensions'
  add_filter 'lib/tasks'
  add_filter 'lib/routable_concern.rb'
  add_filter 'spec'
  add_filter do |source_file|
    source_file.lines.count < 5
  end
end if ARGV.grep(/spec\.rb/).empty? || ENV['CI'].to_s == 'true'
