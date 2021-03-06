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

ActiveRecord::Schema.define(version: 2019_10_27_211937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "center_items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.bigint "item_id"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_center_items_on_center_id"
    t.index ["item_id"], name: "index_center_items_on_item_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "lat"
    t.string "lng"
    t.string "phone"
    t.string "website"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.boolean "notify"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "consumable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needs", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_needs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "age"
    t.boolean "allergies", default: false
    t.boolean "dietRestrictions", default: false
    t.boolean "privacy", default: true
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_users_on_center_id"
  end

  add_foreign_key "center_items", "centers"
  add_foreign_key "center_items", "items"
  add_foreign_key "contacts", "users"
  add_foreign_key "needs", "users"
  add_foreign_key "users", "centers"
end
