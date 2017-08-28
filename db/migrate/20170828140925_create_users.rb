class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :meetup_user_id, null: false
      t.string :country
      t.string :city
      t.string :lon
      t.string :lat
      t.string :active
      t.string :link
      t.string :name

      t.timestamps
    end
  end
end
