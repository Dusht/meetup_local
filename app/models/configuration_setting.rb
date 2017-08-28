class ConfigurationSetting < ApplicationRecord

  def self.get_settings
    return ConfigurationSetting.first
  end
end
