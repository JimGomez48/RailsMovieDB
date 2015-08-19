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

ActiveRecord::Schema.define(version: 20150819034634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "last",  limit: 50, null: false
    t.string "first", limit: 50, null: false
    t.string "sex",   limit: 6,  null: false
    t.date   "dob",              null: false
    t.date   "dod"
  end

  add_index "actors", ["last", "first", "dob"], name: "index_actors_on_last_and_first_and_dob", unique: true, using: :btree

  create_table "directors", force: :cascade do |t|
    t.string "last",  limit: 50, null: false
    t.string "first", limit: 50, null: false
    t.date   "dob",              null: false
    t.date   "dod"
  end

  add_index "directors", ["last", "first", "dob"], name: "index_directors_on_last_and_first_and_dob", unique: true, using: :btree

  create_table "genres", force: :cascade do |t|
    t.string "name", limit: 20, null: false
  end

  create_table "movie_actor_roles", force: :cascade do |t|
    t.integer  "movie_actor_id", null: false
    t.string   "role"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "movie_actor_roles", ["movie_actor_id", "role"], name: "index_movie_actor_roles_on_movie_actor_id_and_role", unique: true, using: :btree

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.string  "role"
  end

  add_index "movie_actors", ["movie_id", "actor_id"], name: "index_movie_actors_on_movie_id_and_actor_id", unique: true, using: :btree

  create_table "movie_directors", force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "director_id", null: false
  end

  add_index "movie_directors", ["movie_id", "director_id"], name: "index_movie_directors_on_movie_id_and_director_id", unique: true, using: :btree

  create_table "movie_genres", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "movie_genres", ["movie_id", "genre_id"], name: "index_movie_genres_on_movie_id_and_genre_id", unique: true, using: :btree

  create_table "movies", force: :cascade do |t|
    t.string  "title",   limit: 100, null: false
    t.integer "year",                null: false
    t.string  "rating",  limit: 10,  null: false
    t.string  "company", limit: 50,  null: false
  end

  add_index "movies", ["title", "year"], name: "index_movies_on_title_and_year", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "username",   limit: 20, null: false
    t.integer  "movie_id",              null: false
    t.integer  "rating",     limit: 2,  null: false
    t.text     "comment"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "last",       limit: 50
    t.string   "first",      limit: 50
    t.string   "username",   limit: 30
    t.string   "email",      limit: 100
    t.string   "password"
    t.string   "salt"
    t.boolean  "active",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last", "first", "username"], name: "index_users_on_last_and_first_and_username", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "movie_actor_roles", "movie_actors", on_delete: :cascade
  add_foreign_key "movie_actors", "actors", on_delete: :cascade
  add_foreign_key "movie_actors", "movies", on_delete: :cascade
  add_foreign_key "movie_directors", "directors", on_delete: :cascade
  add_foreign_key "movie_directors", "movies", on_delete: :cascade
  add_foreign_key "movie_genres", "genres", on_delete: :cascade
  add_foreign_key "movie_genres", "movies", on_delete: :cascade
  add_foreign_key "reviews", "movies", on_delete: :cascade
end
