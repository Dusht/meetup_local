class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :meetup_group_id
      t.string :country
      t.string :city
      t.string :link
      t.string :description
      t.string :name
      t.string :urlname
    end
  end
end
