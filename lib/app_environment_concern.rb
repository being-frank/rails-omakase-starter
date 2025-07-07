module AppEnvironmentConcern

  extend ActiveSupport::Concern

  included do
    def app_development?
      app_env?(:development)
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

    def current_app_env
      Rails.application.config.app_env
    end

    private

      def app_env?(env)
        current_app_env == env.to_sym
      end
  end

end
