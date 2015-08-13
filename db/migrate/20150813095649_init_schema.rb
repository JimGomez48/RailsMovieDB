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
    
    create_table "directors", force: :cascade do |t|
      t.string "last",  limit: 50, null: false
      t.string "first", limit: 50, null: false
      t.date   "dob",              null: false
      t.date   "dod"
    end
    
    create_table "genres", force: :cascade do |t|
      t.string "name", limit: 20
    end
    
    create_table "movie_actors", force: :cascade do |t|
      t.integer "movie_id"
      t.integer "actor_id"
      t.string  "role"
    end
    
    create_table "movie_directors", force: :cascade do |t|
      t.integer "movie_id",    null: false
      t.integer "director_id", null: false
    end
    
    create_table "movie_genres", force: :cascade do |t|
      t.integer "movie_id", null: false
      t.integer "genre_id", null: false
    end
    
    create_table "movies", force: :cascade do |t|
      t.string  "title",   limit: 100, null: false
      t.integer "year",                null: false
      t.string  "rating",  limit: 10,  null: false
      t.string  "company", limit: 50,  null: false
    end
    
    create_table "reviews", force: :cascade do |t|
      t.string   "username",   limit: 20, null: false
      t.integer  "movie_id",              null: false
      t.integer  "rating",     limit: 2,  null: false
      t.text     "comment"
      t.datetime "created_at",            null: false
      t.datetime "updated_at",            null: false
    end
    
    add_foreign_key "movie_actors", "actors", on_delete: :cascade
    add_foreign_key "movie_actors", "movies", on_delete: :cascade
    add_foreign_key "movie_directors", "directors", on_delete: :cascade
    add_foreign_key "movie_directors", "movies", on_delete: :cascade
    add_foreign_key "movie_genres", "genres", on_delete: :cascade
    add_foreign_key "movie_genres", "movies", on_delete: :cascade
    add_foreign_key "reviews", "movies", on_delete: :cascade
  end

  def down
    raise "Can not revert initial migration"
  end
end
