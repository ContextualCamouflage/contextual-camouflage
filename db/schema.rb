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

ActiveRecord::Schema.define(version: 20170416155104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anecdotes", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["submission_id"], name: "index_anecdotes_on_submission_id"
  end

  create_table "illnesses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "body"
  end

  create_table "installations", id: :serial, force: :cascade do |t|
    t.string "locality"
    t.boolean "active"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "active_at"
  end

  create_table "researches", id: :serial, force: :cascade do |t|
    t.string "gender"
    t.string "age"
    t.string "race"
    t.string "occupation"
    t.integer "submission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["submission_id"], name: "index_researches_on_submission_id"
  end

  create_table "submissions", id: :serial, force: :cascade do |t|
    t.string "cookie"
    t.string "relationship"
    t.string "zip_code"
    t.string "ip_address"
    t.string "locality"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "illness_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illness_id"], name: "index_submissions_on_illness_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anecdotes", "submissions"
  add_foreign_key "researches", "submissions"
  add_foreign_key "submissions", "illnesses"
end
