class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    
    create_table "actors", force: :cascade do |t|
      t.string "last",  limit: 50, null: false
      t.string "first", limit: 50, null: false
      t.string "sex",   limit: 6,  null: false
      t.date   "dob",              null: false
      t.date   "dod"
    end
    
    add_index "actors", ["first"], name: "index_actors_on_first", using: :btree
    add_index "actors", ["last", "first", "dob"], name: "index_actors_on_last_and_first_and_dob", unique: true, using: :btree
    
    create_table "directors", force: :cascade do |t|
      t.string "last",  limit: 50, null: false
      t.string "first", limit: 50, null: false
      t.date   "dob",              null: false
      t.date   "dod"
    end
    
    add_index "directors", ["first"], name: "index_directors_on_first", using: :btree
    add_index "directors", ["last", "first", "dob"], name: "index_directors_on_last_and_first_and_dob", unique: true, using: :btree
    
    create_table "genres", force: :cascade do |t|
      t.string "name", limit: 20, null: false
    end
    
    create_table "movie_actor_roles", force: :cascade do |t|
      t.integer "movie_actor_id", null: false
      t.string  "role"
    end
    
    add_index "movie_actor_roles", ["movie_actor_id", "role"], name: "index_movie_actor_roles_on_movie_actor_id_and_role", unique: true, using: :btree
    
    create_table "movie_actors", force: :cascade do |t|
      t.integer "movie_id", null: false
      t.integer "actor_id", null: false
      t.string  "role"
    end
    
    add_index "movie_actors", ["actor_id"], name: "index_movie_actors_on_actor_id", using: :btree
    add_index "movie_actors", ["movie_id", "actor_id"], name: "index_movie_actors_on_movie_id_and_actor_id", unique: true, using: :btree
    
    create_table "movie_directors", force: :cascade do |t|
      t.integer "movie_id",    null: false
      t.integer "director_id", null: false
    end
    
    add_index "movie_directors", ["director_id"], name: "index_movie_directors_on_director_id", using: :btree
    add_index "movie_directors", ["movie_id", "director_id"], name: "index_movie_directors_on_movie_id_and_director_id", unique: true, using: :btree
    
    create_table "movie_genres", force: :cascade do |t|
      t.integer "movie_id", null: false
      t.integer "genre_id", null: false
    end
    
    add_index "movie_genres", ["genre_id"], name: "index_movie_genres_on_genre_id", using: :btree
    add_index "movie_genres", ["movie_id", "genre_id"], name: "index_movie_genres_on_movie_id_and_genre_id", unique: true, using: :btree
    
    create_table "movies", force: :cascade do |t|
      t.string  "title",       limit: 100, null: false
      t.integer "year"
      t.string  "mpaa_rating", limit: 10,  null: false
      t.string  "company",     limit: 50,  null: false
    end
    
    add_index "movies", ["company"], name: "index_movies_on_company", using: :btree
    add_index "movies", ["title", "company"], name: "index_movies_on_title_and_company", unique: true, using: :btree
    add_index "movies", ["title", "year"], name: "index_movies_on_title_and_year", unique: true, using: :btree
    
    create_table "reviews", force: :cascade do |t|
      t.integer  "user_id",              null: false
      t.integer  "movie_id",             null: false
      t.integer  "rating",     limit: 2, null: false
      t.text     "comment"
      t.datetime "created_at",           null: false
      t.datetime "updated_at",           null: false
    end
    
    add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
    add_index "reviews", ["user_id", "movie_id"], name: "index_reviews_on_user_id_and_movie_id", unique: true, using: :btree
    
    create_table "users", force: :cascade do |t|
      t.string   "last",       limit: 50,                 null: false
      t.string   "first",      limit: 50,                 null: false
      t.string   "username",   limit: 30,                 null: false
      t.string   "email",      limit: 100,                null: false
      t.string   "password",                              null: false
      t.string   "salt",                                  null: false
      t.boolean  "active",                 default: true, null: false
      t.datetime "created_at",                            null: false
      t.datetime "updated_at",                            null: false
    end
    
    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index "users", ["first"], name: "index_users_on_first", using: :btree
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
    add_foreign_key "reviews", "users", on_delete: :cascade
  end

  def down
    raise "Can not revert initial migration"
  end
end
