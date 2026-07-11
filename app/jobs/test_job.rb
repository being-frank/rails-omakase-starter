class TestJob < ApplicationJob

  queue_as :default

  def perform
    Rails.logger.debug 'Completed TestJob!'
  end

end
