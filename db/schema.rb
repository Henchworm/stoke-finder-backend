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

ActiveRecord::Schema.define(version: 2022_02_24_052205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.text "guest_email_addresses"
    t.datetime "date"
    t.text "comment"
    t.text "activities"
    t.boolean "favorite"
    t.integer "rec_area_id"
    t.bigint "custom_rec_areas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_rec_areas_id"], name: "index_adventures_on_custom_rec_areas_id"
  end

  create_table "custom_rec_areas", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "latitude"
    t.string "activities"
    t.text "comments"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_custom_rec_areas_on_user_id"
  end

  create_table "user_adventures", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "adventure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adventure_id"], name: "index_user_adventures_on_adventure_id"
    t.index ["user_id"], name: "index_user_adventures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.integer "access"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.text "activity_preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adventures", "custom_rec_areas", column: "custom_rec_areas_id"
  add_foreign_key "custom_rec_areas", "users"
  add_foreign_key "user_adventures", "adventures"
  add_foreign_key "user_adventures", "users"
end
