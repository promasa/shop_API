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

ActiveRecord::Schema.define(version: 2020_01_31_075418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.bigint "item_id"
    t.string "text"
    t.bigint "evaluated_id"
    t.bigint "evaluator_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["evaluated_id"], name: "index_evaluations_on_evaluated_id"
    t.index ["evaluator_id"], name: "index_evaluations_on_evaluator_id"
    t.index ["item_id"], name: "index_evaluations_on_item_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_favorites_on_item_id"
    t.index ["user_id", "item_id"], name: "index_favorites_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "item_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_chats_on_item_id"
    t.index ["user_id"], name: "index_item_chats_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "private_item_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_private_item_chats_on_item_id"
    t.index ["user_id"], name: "index_private_item_chats_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bio"
    t.string "token"
  end

  add_foreign_key "evaluations", "users", column: "evaluated_id"
  add_foreign_key "evaluations", "users", column: "evaluator_id"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "item_chats", "items"
  add_foreign_key "item_chats", "users"
  add_foreign_key "items", "users"
  add_foreign_key "private_item_chats", "items"
  add_foreign_key "private_item_chats", "users"
  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "users"
  add_foreign_key "relationships", "users", column: "followed_id"
  add_foreign_key "relationships", "users", column: "follower_id"
end
