module KitsuneUI
  class Configuration

    include ActiveSupport::Configurable

    config_accessor \
      :setting_one,
      :setting_two

    def initialize
      self.setting_one = 'default_value_one'
      self.setting_two = 'default_value_two'
    end

  end
end
