class ChangeColumnActiveToStatusForUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :active
    add_column :users, :status, :string
  end
end
