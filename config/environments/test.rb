# frozen_string_literal: true

require 'host_config'
require 'active_support/core_ext/integer/time'

host_config = HostConfig.new

Rails.application.configure do
  # ==== Hosts

  config.hosts      = host_config.hosts(protocol: false)
  config.asset_host = host_config.asset_host

  # ==== General

  config.action_dispatch.show_exceptions = false
  config.cache_classes                   = true
  config.consider_all_requests_local     = true
  config.time_zone                       = 'UTC'

  # NB! Add `bundle exec rails zeitwerk:check` as part of CI to check for errors.
  # https://guides.rubyonrails.org/classic_to_zeitwerk_howto.html#zeitwerk-check
  config.eager_load = false

  # ==== ActionCable

  # ==== ActionController

  config.action_controller.allow_forgery_protection          = false
  config.action_controller.default_url_options               = host_config.default_url_options
  config.action_controller.perform_caching                   = false
  config.action_controller.raise_on_missing_callback_actions = true

  # ==== ActionDispatch

  config.action_dispatch.show_exceptions = :rescuable

  # ==== ActionMailer

  config.action_mailer.default_url_options = host_config.default_url_options
  config.action_mailer.delivery_method     = :test
  config.action_mailer.perform_caching     = false

  # ==== ActionView

  config.action_view.annotate_rendered_view_with_filenames = true
  config.action_view.cache_template_loading                = false

  # ==== ActiveJob

  config.active_job.queue_adapter = :test

  # ==== ActiveRecord

  # ==== ActiveStorage

  config.active_storage.service = :test

  # ==== ActiveSupport

  config.active_support.deprecation                     = :stderr
  config.active_support.disallowed_deprecation          = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # ==== Assets

  # ==== Caching

  config.cache_store                = :null_store
  config.public_file_server.headers = {
    'cache-control' => 'public, max-age=3600'
  }

  # ==== I18n

  config.i18n.raise_on_missing_translations = true
end
