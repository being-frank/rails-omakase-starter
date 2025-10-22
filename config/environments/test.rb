require 'host_config'
require 'active_support/core_ext/integer/time'

host_config = HostConfig.new

Rails.application.configure do
  config.hosts      = host_config.hosts
  config.asset_host = host_config.asset_url

  # ==== General

  config.cache_store                        = :null_store
  config.consider_all_requests_local        = true
  config.eager_load                         = ENV['CI'].to_s == 'true'
  config.enable_reloading                   = false
  config.i18n.raise_on_missing_translations = true
  config.time_zone                          = 'UTC'
  config.public_file_server.headers         = {
    'cache-control' => 'public, max-age=3600'
  }

  # ==== ActionController

  config.action_controller.allow_forgery_protection          = false
  config.action_controller.raise_on_missing_callback_actions = true

  # ==== ActionDispatch

  config.action_dispatch.show_exceptions = :rescuable

  # ==== ActionMailer

  config.action_mailer.default_url_options = host_config.default_url_options
  config.action_mailer.delivery_method     = :test

  # ==== ActionView

  config.action_view.annotate_rendered_view_with_filenames = true

  # ==== ActiveJob

  config.active_job.queue_adapter = :test

  # ==== ActiveStorage

  config.active_storage.service = :test

  # ==== ActiveSupport

  config.active_support.deprecation = :stderr
end
