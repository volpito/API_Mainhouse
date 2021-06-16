# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_16_091658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_column_agencies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "add_column_to_owners", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agencies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "city"
    t.string "adress"
    t.string "zipcode"
    t.string "phone_number"
    t.text "logo_agency_url"
    t.string "siren"
    t.index ["email"], name: "index_agencies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_agencies_on_reset_password_token", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.bigint "agency_id"
    t.string "name"
    t.string "reference"
    t.string "city"
    t.string "adress"
    t.string "zipcode"
    t.text "building_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agency_id"], name: "index_buildings_on_agency_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "agency_id"
    t.bigint "building_id"
    t.string "title"
    t.string "description"
    t.datetime "datetime"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agency_id"], name: "index_events_on_agency_id"
    t.index ["building_id"], name: "index_events_on_building_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "agency_id"
    t.bigint "building_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "lot"
    t.string "flat_number"
    t.text "owner_pic_profil"
    t.index ["agency_id"], name: "index_owners_on_agency_id"
    t.index ["building_id"], name: "index_owners_on_building_id"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  add_foreign_key "owners", "agencies"
  add_foreign_key "owners", "buildings"
end
