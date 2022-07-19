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

ActiveRecord::Schema.define(version: 2022_07_19_080411) do

  create_table "equipment", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "equipment_detail_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_detail_id"], name: "index_equipment_on_equipment_detail_id"
    t.index ["spot_id", "equipment_detail_id"], name: "index_equipment_on_spot_id_and_equipment_detail_id", unique: true
    t.index ["spot_id"], name: "index_equipment_on_spot_id"
  end

  create_table "equipment_details", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spots", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "target_people", force: :cascade do |t|
    t.string "people", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "avator"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "equipment", "equipment_details"
  add_foreign_key "equipment", "spots"
  add_foreign_key "spots", "users"
end
