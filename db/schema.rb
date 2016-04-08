# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160408133727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "place_photos", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "photo_reference"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "place_photos", ["place_id"], name: "index_place_photos_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "location_id"
    t.decimal  "rating"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "vicinity"
    t.text     "description"
    t.integer  "region_id"
    t.integer  "default_budget"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "places", ["region_id"], name: "index_places_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "description"
    t.integer  "point",           default: 0
    t.string   "avatar"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
