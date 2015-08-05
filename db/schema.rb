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

ActiveRecord::Schema.define(version: 20150804195731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "last",  limit: 50, null: false
    t.string "first", limit: 50, null: false
    t.string "sex",   limit: 6,  null: false
    t.date   "dob",              null: false
    t.date   "dod"
  end

  create_table "directors", force: :cascade do |t|
    t.string "last",  limit: 50, null: false
    t.string "first", limit: 50, null: false
    t.date   "dob",              null: false
    t.date   "dod"
  end

  create_table "movies", force: :cascade do |t|
    t.string  "title",   limit: 100, null: false
    t.integer "year",                null: false
    t.string  "rating",  limit: 10,  null: false
    t.string  "company", limit: 50,  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "username",   limit: 20, null: false
    t.integer  "mid",                   null: false
    t.integer  "rating",     limit: 2,  null: false
    t.text     "comment"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "reviews", "movies", column: "mid", on_delete: :cascade
end
