# frozen_string_literal: true

module EnvironmentHelper

  def app_env?(env)
    Rails.application.config.app_env == env.to_sym
  end

  def app_development?
    app_env?(:production)
  end

  def app_production?
    app_env?(:production)
  end

  def app_staging?
    app_env?(:staging)
  end

  def app_test?
    app_env?(:test)
  end

end
