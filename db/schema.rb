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

ActiveRecord::Schema.define(version: 20180117214012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "phone"
    t.string   "email"
    t.string   "webpage"
    t.string   "instagram"
    t.string   "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "place"
    t.string   "map_url"
    t.string   "code_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_url"
    t.date     "release_date"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.string   "text1"
    t.string   "text2"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "featured"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "photo_url"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "filename"
    t.integer  "order"
    t.integer  "post_id"
    t.string   "caption"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "featured"
    t.string   "subtitle"
    t.string   "second_text"
    t.string   "image_url"
    t.date     "release_date"
    t.string   "place"
    t.integer  "flaitometro"
    t.string   "youtube_url"
  end

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "map_url"
    t.string   "image_url"
    t.string   "city"
    t.string   "region"
    t.string   "address"
    t.string   "commment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
