class AddColumnsToConfigurationSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :configuration_settings, :current_group_id, :integer, default: 0
    add_column :configuration_settings, :last_error_timestamp, :datetime
  end
end
