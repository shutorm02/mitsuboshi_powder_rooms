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

ActiveRecord::Schema.define(version: 2022_10_15_112348) do

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
    t.integer "target_person_id"
    t.index ["target_person_id"], name: "index_equipment_details_on_target_person_id"
  end

  create_table "feedback_tags", force: :cascade do |t|
    t.integer "feedback_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feedback_id", "tag_id"], name: "index_feedback_tags_on_feedback_id_and_tag_id", unique: true
    t.index ["feedback_id"], name: "index_feedback_tags_on_feedback_id"
    t.index ["tag_id"], name: "index_feedback_tags_on_tag_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.float "rate", default: 0.0, null: false
    t.string "feedback_comment", null: false
    t.integer "user_id", null: false
    t.integer "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_feedbacks_on_spot_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "spot_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_likes_on_spot_id"
    t.index ["user_id", "spot_id"], name: "index_likes_on_user_id_and_spot_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_spots_on_address", unique: true
    t.index ["name"], name: "index_spots_on_name", unique: true
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "content", null: false
    t.integer "target_person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content"], name: "index_tags_on_content", unique: true
    t.index ["target_person_id"], name: "index_tags_on_target_person_id"
  end

  create_table "target_people", force: :cascade do |t|
    t.string "target", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["target"], name: "index_target_people_on_target", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "avatar"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "equipment", "equipment_details"
  add_foreign_key "equipment", "spots"
  add_foreign_key "equipment_details", "target_people"
  add_foreign_key "feedback_tags", "feedbacks"
  add_foreign_key "feedback_tags", "tags"
  add_foreign_key "feedbacks", "spots"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "likes", "spots"
  add_foreign_key "likes", "users"
  add_foreign_key "spots", "users"
  add_foreign_key "tags", "target_people"
end
