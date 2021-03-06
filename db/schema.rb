# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130822150119) do

  create_table "card_models", force: true do |t|
    t.string "recto"
    t.string "verso"
    t.string "name"
  end

  create_table "cards", force: true do |t|
    t.integer "card_model_id"
  end

  create_table "cards_decks", force: true do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "rank"
  end

  create_table "decks", force: true do |t|
    t.string "name"
  end

  create_table "sign_in_tokens", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "privilege",       default: "normal"
    t.string   "session_token"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
