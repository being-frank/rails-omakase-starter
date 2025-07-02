# frozen_string_literal: true

# rubocop:disable Rails/ApplicationController
class AbstractApplicationController < ActionController::Base

  protect_from_forgery with: :exception

end
# rubocop:enable Rails/ApplicationController
