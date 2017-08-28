class CreateOneConfigurationSetting < ActiveRecord::Migration[5.1]
  def self.up
    ConfigurationSetting.create
  end

  def self.down
    ConfigurationSetting.delete_all
  end
end
