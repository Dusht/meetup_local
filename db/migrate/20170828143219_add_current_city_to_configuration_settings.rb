class AddCurrentCityToConfigurationSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :configuration_settings, :current_city_index, :integer, default: 0
  end
end
