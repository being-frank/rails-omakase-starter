# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # config.hosts      = host_config.hosts(protocol: false)
  # config.asset_host = host_config.asset_host
  config.host_authorization = {
    exclude: ->(request) { request.path == '/up' }
  }

  # ==== General

  config.cache_store                 = :solid_cache_store
  config.consider_all_requests_local = false
  config.eager_load                  = true
  config.enable_reloading            = false
  config.i18n.fallbacks              = true
  config.public_file_server.enabled  = true
  config.require_master_key          = true
  config.silence_healthcheck_path    = '/up'
  config.public_file_server.headers  = {
    'cache-control' => "public, max-age=#{1.year.to_i}"
  }

  # ==== SSL

  config.assume_ssl  = true
  config.force_ssl   = true
  config.ssl_options = {
    hsts:     {
      expires: 12.months, preload: true
    },
    redirect: {
      exclude: ->(request) { request.path == '/up' }
    }
  }

  # ==== Logging

  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')
  config.log_tags  = %i[request_id]
  config.logger    = ActiveSupport::TaggedLogging.logger(STDOUT)

  # ==== ActionCable

  # config.action_cable.allowed_request_origins            = host_config.hosts
  config.action_cable.disable_request_forgery_protection = true

  # ==== ActionController

  config.action_controller.perform_caching = true

  # ==== ActionDispatch

  # config.action_dispatch.tld_length = host_config.tld_length

  # ==== ActionMailbox

  config.action_mailbox.incinerate_after = 2.days

  # ==== ActionMailer

  config.action_mailer.default_url_options   = { host: 'example.com' }
  config.action_mailer.raise_delivery_errors = false
  # config.action_mailer.smtp_settings         = {
  #   user_name:      Rails.application.credentials.dig(:smtp, :user_name),
  #   password:       Rails.application.credentials.dig(:smtp, :password),
  #   address:        'smtp.example.com',
  #   port:           587,
  #   authentication: :plain
  # }

  # ==== ActionView

  config.action_view.annotate_rendered_view_with_filenames = false

  # ==== ActiveJob

  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to  = { database: { writing: :queue } }

  # ==== ActiveRecord

  config.active_record.attributes_for_inspect      = %i[id]
  config.active_record.dump_schema_after_migration = false
  config.active_record.query_log_tags_enabled      = false

  # ==== ActiveStorage

  config.active_storage.service = :local

  # ==== ActiveSupport

  config.active_support.report_deprecations = false
end
