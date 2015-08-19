class CreateMovieActorRoles < ActiveRecord::Migration
  def change
    create_table :movie_actor_roles do |t|
      t.integer :movie_actor_id, null: false
      t.string :role
    end

    add_foreign_key :movie_actor_roles, :movie_actors, on_delete: :cascade
    add_index :movie_actor_roles, [:movie_actor_id, :role], unique: true
  end
end
