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

ActiveRecord::Schema.define(version: 2020_04_22_011021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "mail_address", null: false
    t.string "password_digest", null: false
    t.string "admin_flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_accounts_on_created_at"
    t.index ["member_id", "created_at"], name: "index_accounts_on_member_id_and_created_at"
  end

  create_table "member_edit_histories", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.string "face_photo_path"
    t.string "one_word_comment"
    t.string "personality"
    t.string "hobby"
    t.string "favorite_things"
    t.string "hate_things"
    t.string "strong_point"
    t.string "week_point"
    t.string "special_skill"
    t.string "week_things"
    t.string "happy_done_things"
    t.string "disgusted_things"
    t.string "freedom_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_member_edit_histories_on_created_at"
    t.index ["member_id", "created_at"], name: "index_member_edit_histories_on_member_id_and_created_at"
  end

  create_table "members", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "last_name_phonetic", null: false
    t.string "first_name", null: false
    t.string "first_name_phonetic", null: false
    t.string "face_photo_path"
    t.string "birthplace"
    t.integer "birth_year_month"
    t.integer "joining_year"
    t.string "one_word_comment"
    t.string "personality"
    t.string "hobby"
    t.string "favorite_things"
    t.string "hate_things"
    t.string "strong_point"
    t.string "week_point"
    t.string "special_skill"
    t.string "week_things"
    t.string "happy_done_things"
    t.string "disgusted_things"
    t.string "freedom_message"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["last_name_phonetic", "first_name_phonetic"], name: "index_members_on_last_name_phonetic_and_first_name_phonetic"
  end

  add_foreign_key "accounts", "members"
  add_foreign_key "member_edit_histories", "members"
end
