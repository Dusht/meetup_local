# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170828143219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configuration_settings", force: :cascade do |t|
    t.boolean "groups_data_completed", default: false
    t.integer "groups_offset", default: 0
    t.boolean "users_data_completed", default: false
    t.integer "users_offset", default: 0
    t.integer "current_city_index", default: 0
  end

  create_table "groups", force: :cascade do |t|
    t.integer "meetup_group_id"
    t.string "country"
    t.string "city"
    t.string "link"
    t.string "description"
    t.string "name"
    t.string "urlname"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "meetup_user_id", null: false
    t.string "country"
    t.string "city"
    t.string "lon"
    t.string "lat"
    t.string "active"
    t.string "link"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
