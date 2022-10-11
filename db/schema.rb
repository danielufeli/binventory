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

ActiveRecord::Schema[7.0].define(version: 2022_10_10_214038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_currency_rates", force: :cascade do |t|
    t.string "symbol"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_frames", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status"
    t.integer "stock"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_glasses", force: :cascade do |t|
    t.float "total"
    t.bigint "user_id", null: false
    t.bigint "api_v1_frame_id", null: false
    t.bigint "api_v1_lense_id", null: false
    t.bigint "api_v1_currency_rate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_v1_currency_rate_id"], name: "index_api_v1_glasses_on_api_v1_currency_rate_id"
    t.index ["api_v1_frame_id"], name: "index_api_v1_glasses_on_api_v1_frame_id"
    t.index ["api_v1_lense_id"], name: "index_api_v1_glasses_on_api_v1_lense_id"
    t.index ["user_id"], name: "index_api_v1_glasses_on_user_id"
  end

  create_table "api_v1_lenses", force: :cascade do |t|
    t.string "colour"
    t.text "description"
    t.integer "prescription_type"
    t.integer "lens_type"
    t.integer "stock"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_v1_glasses", "api_v1_currency_rates"
  add_foreign_key "api_v1_glasses", "api_v1_frames"
  add_foreign_key "api_v1_glasses", "api_v1_lenses"
  add_foreign_key "api_v1_glasses", "users"
end
