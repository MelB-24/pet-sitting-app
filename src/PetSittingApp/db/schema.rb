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

ActiveRecord::Schema.define(version: 2019_11_01_011534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approved_sitters", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_approved_sitters_on_owner_id"
    t.index ["sitter_id"], name: "index_approved_sitters_on_sitter_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.time "time_starts"
    t.time "time_finishes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "approved_sitter_id"
    t.boolean "approved_booking"
    t.index ["approved_sitter_id"], name: "index_bookings_on_approved_sitter_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.date "date_of_birth"
    t.bigint "microchip_number"
    t.text "bio"
    t.integer "sex"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "owner_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owner_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owner_users_on_reset_password_token", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_user_id"], name: "index_owners_on_owner_user_id"
  end

  create_table "sitter_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sitter_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sitter_users_on_reset_password_token", unique: true
  end

  create_table "sitters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "suburb"
    t.string "state"
    t.integer "postcode"
    t.string "business_name"
    t.integer "price"
    t.bigint "sitter_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_user_id"], name: "index_sitters_on_sitter_user_id"
  end

  add_foreign_key "approved_sitters", "owners"
  add_foreign_key "approved_sitters", "sitters"
  add_foreign_key "bookings", "approved_sitters"
  add_foreign_key "dogs", "owners"
  add_foreign_key "owners", "owner_users"
  add_foreign_key "sitters", "sitter_users"
end
