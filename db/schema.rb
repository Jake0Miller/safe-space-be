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

ActiveRecord::Schema.define(version: 2019_10_20_233722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "center_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "item_id"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_center_items_on_center_id"
    t.index ["item_id"], name: "index_center_items_on_item_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "address"
    t.string "lat"
    t.string "lng"
    t.string "phone"
    t.string "website"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "center_items", "centers"
  add_foreign_key "center_items", "items"
end
