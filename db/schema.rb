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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_103228) do
  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", charset: "utf8mb3", force: :cascade do |t|
    t.string "user_id", limit: 10, default: "NULL"
    t.string "category_id", limit: 10, default: "NULL"
    t.string "sub_category_id", limit: 10, default: "NULL"
    t.string "title", limit: 100, default: "NULL"
    t.string "slug", limit: 100, default: "NULL"
    t.string "body", default: "NULL"
    t.string "image", default: "NULL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_posts_on_slug"
  end

  create_table "sub_categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "category_id"
    t.string "slug"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "fullName", limit: 100, default: "NULL"
    t.string "username", limit: 100, default: "NULL"
    t.string "mobile", limit: 29, default: "NULL"
    t.string "email", limit: 90, default: "NULL"
    t.string "password_digest", limit: 56, default: "NULL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
