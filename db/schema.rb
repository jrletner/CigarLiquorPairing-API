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

ActiveRecord::Schema[7.0].define(version: 2023_06_07_021611) do
  create_table "cigars", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "brand", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
    t.index ["user_id"], name: "index_cigars_on_user_id"
  end

  create_table "liquors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "brand", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
    t.index ["user_id"], name: "index_liquors_on_user_id"
  end

  create_table "pairings", force: :cascade do |t|
    t.integer "cigar_id", null: false
    t.integer "liquor_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cigar_id"], name: "index_pairings_on_cigar_id"
    t.index ["liquor_id"], name: "index_pairings_on_liquor_id"
    t.index ["user_id"], name: "index_pairings_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "value"
    t.datetime "expiry"
    t.string "ip"
    t.datetime "revocation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cigars", "users"
  add_foreign_key "liquors", "users"
  add_foreign_key "pairings", "cigars"
  add_foreign_key "pairings", "liquors"
  add_foreign_key "pairings", "users"
  add_foreign_key "tokens", "users"
end
