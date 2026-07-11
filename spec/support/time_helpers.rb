RSpec.configure do |config|
  config.include ActiveSupport::Testing::TimeHelpers

  config.around(:each, :travel_to) do |example|
    time = example.metadata[:travel_to]

    travel_to(time) do
      example.run
    end
  end
end
