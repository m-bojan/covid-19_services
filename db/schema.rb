# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_28_164309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "password_digest"
    t.integer "role", default: 1, null: false
    t.integer "status", default: 1, null: false
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "state_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "item_type", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "pharmacies", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.string "name", null: false
    t.string "location"
    t.decimal "longitude", precision: 10, scale: 8, default: "0.0", null: false
    t.decimal "latitude", precision: 10, scale: 8, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id", "name"], name: "index_pharmacies_on_region_id_and_name", unique: true
    t.index ["region_id"], name: "index_pharmacies_on_region_id"
  end

  create_table "pharmacy_items", force: :cascade do |t|
    t.bigint "pharmacy_id", null: false
    t.bigint "item_id", null: false
    t.integer "count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_pharmacy_items_on_item_id"
    t.index ["pharmacy_id", "item_id"], name: "index_pharmacy_items_on_pharmacy_id_and_item_id", unique: true
    t.index ["pharmacy_id"], name: "index_pharmacy_items_on_pharmacy_id"
  end

  create_table "regions", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_regions_on_city_id"
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "states", on_delete: :cascade
  add_foreign_key "pharmacies", "regions", on_delete: :cascade
  add_foreign_key "pharmacy_items", "items", on_delete: :cascade
  add_foreign_key "pharmacy_items", "pharmacies", on_delete: :cascade
  add_foreign_key "regions", "cities", on_delete: :cascade
end
