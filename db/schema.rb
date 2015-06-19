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

ActiveRecord::Schema.define(version: 20150619182935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ousers", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.datetime "last_update"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "post_recipients", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "post_recipients", ["post_id"], name: "index_post_recipients_on_post_id", using: :btree
  add_index "post_recipients", ["recipient_id"], name: "index_post_recipients_on_recipient_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "ouser_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "ouser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipients", ["ouser_id"], name: "index_recipients_on_ouser_id", using: :btree

  add_foreign_key "post_recipients", "posts"
  add_foreign_key "post_recipients", "recipients"
  add_foreign_key "recipients", "ousers"
end
