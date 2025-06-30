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

    config.autoload_lib(
      ignore: %w[
        assets
        tasks
      ]
    )

    # ==== General

    # ==== ActiveRecord

    config.active_record.default_timezone         = :utc
    # config.active_record.query_log_tags_enabled   = true
    config.active_record.schema_format            = :ruby
    config.active_record.generate_secure_token_on = :create

  end
end
