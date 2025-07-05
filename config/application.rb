# frozen_string_literal: true

require_relative 'boot'
require 'rails'

%w[
  active_record/railtie
  active_storage/engine
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  action_mailbox/engine
  action_text/engine
  rails/test_unit/railtie
].each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

Bundler.require(*Rails.groups)

module RailsQuickStart
  class Application < Rails::Application

    config.load_defaults 8.0

    # ==== Custom Configuration

    config.app_env = ENV.fetch('X_APP_ENV', Rails.env).to_sym

    # ==== General

    config.autoload_lib(
      ignore: %w[
        assets
        core_extensions
        tasks
      ]
    )

    config.credentials.content_path = Rails.root.join("config/credentials/#{config.app_env}.yml.enc")
    config.credentials.key_path     = Rails.root.join("config/credentials/#{config.app_env}.key")

    # ==== ActiveRecord

    config.active_record.default_timezone         = :utc
    config.active_record.schema_format            = :ruby
    config.active_record.generate_secure_token_on = :create

  end
end
