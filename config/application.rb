require_relative 'boot'

require 'rails'

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module RailsOmakaseStarter
  class Application < Rails::Application

    config.load_defaults 8.0

    config.autoload_lib ignore: %w[
      assets
      core_extensions
      host_config
      generators
      tasks
    ]

    # ==== Annotations

    config.annotations.register_tags(*%w[DEPRECATE DOCUMENT REFACTOR])

    # ==== General

    config.beginning_of_week = :monday
    config.time_zone         = 'UTC' # ActiveSupport::TimeZone.all

    # ==== Generators

    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: 'spec/factories', filename_proc: proc { |f| "#{f.singularize}_factory" }
      g.helper              false
      g.orm                 :active_record, primary_key_type: :uuid
      g.template_engine     :erb
      g.test_framework      :rspec, fixtures: true, view_specs: false
    end

    # ==== i18n

    config.i18n.available_locales = :en
    config.i18n.default_locale    = :en

    # ==== ActiveJob

    config.active_job.queue_adapter = :solid_queue

    # ==== ActiveRecord

    config.active_record.default_timezone         = :utc
    config.active_record.schema_format            = :ruby
    config.active_record.generate_secure_token_on = :create

    # ==== ActiveStorage

    config.active_storage.track_variants    = false
    config.active_storage.variant_processor = :vips

    # ==== Solid Queue

    # config.solid_queue.silence_polling = true
    config.solid_queue.logger = ActiveSupport::TaggedLogging.logger(STDOUT)

    # ==== Mission Control Jobs

    config.mission_control.jobs.http_basic_auth_enabled = false

  end
end
