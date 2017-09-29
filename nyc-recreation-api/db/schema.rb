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

ActiveRecord::Schema.define(version: 20170929214136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bbqs", force: :cascade do |t|
    t.string "Prop_ID"
    t.string "Name"
    t.string "Location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string "Prop_ID"
    t.string "Name"
    t.string "Location"
    t.string "Phone"
    t.string "Pools_outdoor_Type"
    t.string "Setting"
    t.string "Size"
    t.string "Accessible"
    t.string "lat"
    t.string "lon"
    t.string "rec_center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tennis", force: :cascade do |t|
    t.string "Prop_ID"
    t.string "Name"
    t.string "Location"
    t.string "Phone"
    t.string "Courts"
    t.string "Indoor_Outdoor"
    t.string "Tennis_Type"
    t.string "Accessible"
    t.string "Info"
    t.string "lat"
    t.string "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_prefs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "zoo_id"
    t.integer "tenni_id"
    t.integer "pool_id"
    t.integer "bbq_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zoos", force: :cascade do |t|
    t.string "Prop_ID"
    t.string "Name"
    t.string "Location"
    t.string "Phone_Num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
