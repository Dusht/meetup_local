class CreateConfigurationSetting < ActiveRecord::Migration[5.1]
  def change
    create_table :configuration_settings do |t|
      t.boolean :groups_data_completed, default: false
      t.integer :groups_offset, default: 0
      t.boolean :users_data_completed, default: false
      t.integer :users_offset, default: 0
    end
  end
end
