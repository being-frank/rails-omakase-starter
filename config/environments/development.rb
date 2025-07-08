require 'active_support/core_ext/integer/time'

Warning[:deprecated] = true

Rails.application.configure do
  # config.hosts      = host_config.hosts(protocol: false)
  # config.asset_host = host_config.asset_host

  # ==== General

  config.cache_store                        = :solid_cache_store
  config.consider_all_requests_local        = true
  config.eager_load                         = false
  config.enable_reloading                   = true
  config.force_ssl                          = false
  config.i18n.raise_on_missing_translations = false
  config.public_file_server.enabled         = true
  config.require_master_key                 = true
  config.server_timing                      = true

  # ==== ActionCable

  # config.action_cable.allowed_request_origins            = host_config.hosts
  config.action_cable.disable_request_forgery_protection = false

  # ==== ActionController

  # config.action_controller.default_url_options               = host_config.default_url_options
  config.action_controller.raise_on_missing_callback_actions = true
  # Run rails dev:cache to toggle Action Controller caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching               = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers                      = {
      'cache-control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
  end

  # ==== ActionDispatch

  # config.action_dispatch.tld_length = host_config.tld_length

  # ==== ActionMailbox

  config.action_mailbox.incinerate_after = 2.days

  # ==== ActionMailer

  config.action_mailer.default_url_options   = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method       = :smtp
  config.action_mailer.perform_caching       = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings         = {
    address: 'mailhog',
    port:    1025,
    tls:     false
  }

  # ==== ActionView

  config.action_view.annotate_rendered_view_with_filenames = false

  # ==== ActiveJob

  config.active_job.verbose_enqueue_logs = true

  # ==== ActiveRecord

  config.active_record.action_on_strict_loading_violation = :raise # :log
  config.active_record.migration_error                    = :page_load
  config.active_record.query_log_tags_enabled             = true
  config.active_record.strict_loading_by_default          = false
  config.active_record.verbose_query_logs                 = true

  # ==== ActiveStorage

  config.active_storage.service = :local

  # ==== ActiveSupport

  config.active_support.deprecation                     = :log
  config.active_support.disallowed_deprecation          = :raise
  config.active_support.disallowed_deprecation_warnings = []
end
