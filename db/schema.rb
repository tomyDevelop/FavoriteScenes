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

ActiveRecord::Schema[7.0].define(version: 2024_05_08_112834) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort_key"
    t.index ["category_name"], name: "index_categories_on_category_name", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id"
    t.bigint "scene_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_collection_id"], name: "index_comments_on_scene_collection_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "interest", null: false
    t.integer "sort_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest"], name: "index_interests_on_interest", unique: true
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.index ["interest_id"], name: "index_interests_users_on_interest_id"
    t.index ["user_id"], name: "index_interests_users_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "scene_collections", force: :cascade do |t|
    t.string "video_id", null: false
    t.string "video_title"
    t.string "channel_name"
    t.text "short_description", null: false
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_thumbnail_url"
    t.index ["category_id"], name: "index_scene_collections_on_category_id"
    t.index ["user_id"], name: "index_scene_collections_on_user_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.integer "seconds", null: false
    t.text "highlight"
    t.bigint "scene_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_collection_id"], name: "index_scenes_on_scene_collection_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "account_name", null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["account_name"], name: "index_users_on_account_name", unique: true
  end

end
