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

ActiveRecord::Schema.define(version: 20170924224826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_activities", force: :cascade do |t|
    t.bigint "user_id"
    t.date "registered_on"
    t.boolean "activity_1", default: false, null: false
    t.boolean "activity_2", default: false, null: false
    t.boolean "activity_3", default: false, null: false
    t.boolean "activity_4", default: false, null: false
    t.boolean "activity_5", default: false, null: false
    t.boolean "activity_6", default: false, null: false
    t.boolean "activity_7", default: false, null: false
    t.boolean "activity_8", default: false, null: false
    t.boolean "activity_9", default: false, null: false
    t.boolean "activity_10", default: false, null: false
    t.boolean "activity_11", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_activities_on_user_id"
  end

  create_table "hungers", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "registered_at"
    t.string "local"
    t.string "sensation"
    t.string "question"
    t.integer "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hungers_on_user_id"
  end

  create_table "perimeters", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "wrist"
    t.integer "arm"
    t.integer "chest"
    t.integer "waist"
    t.integer "abdomen"
    t.integer "hip"
    t.integer "thigh"
    t.integer "calf"
    t.date "registered_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_perimeters_on_user_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "category"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_priorities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "weights", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "registered_on"
    t.index ["user_id"], name: "index_weights_on_user_id"
  end

  add_foreign_key "daily_activities", "users"
  add_foreign_key "hungers", "users"
  add_foreign_key "perimeters", "users"
  add_foreign_key "priorities", "users"
  add_foreign_key "weights", "users"
end
