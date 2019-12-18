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

ActiveRecord::Schema.define(version: 2019_12_18_064144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "film_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_bookings_on_client_id"
    t.index ["film_id"], name: "index_bookings_on_film_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "screen_name"
    t.string "country"
    t.string "city"
    t.text "intro"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_clients_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "right_holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "right_holder_id"], name: "index_conversations_on_client_id_and_right_holder_id", unique: true
    t.index ["client_id"], name: "index_conversations_on_client_id"
    t.index ["right_holder_id"], name: "index_conversations_on_right_holder_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "intro"
    t.string "director"
    t.json "images"
    t.text "document"
    t.integer "production_year"
    t.string "production_country"
    t.integer "running_time"
    t.text "cast"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "right_holder_id"
    t.index ["right_holder_id"], name: "index_films_on_right_holder_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "conversation_id"
    t.bigint "client_id"
    t.bigint "right_holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_messages_on_client_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["right_holder_id"], name: "index_messages_on_right_holder_id"
  end

  create_table "right_holders", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "intro"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_right_holders_on_confirmation_token", unique: true
    t.index ["email"], name: "index_right_holders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_right_holders_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "clients"
  add_foreign_key "bookings", "films"
  add_foreign_key "conversations", "clients"
  add_foreign_key "conversations", "right_holders"
  add_foreign_key "films", "right_holders"
  add_foreign_key "messages", "clients"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "right_holders"
end
