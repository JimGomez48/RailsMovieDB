class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, limit: 100, null: false
      t.integer :year, limit: 4, null: false
      t.string :rating, limit: 10, null: false
      t.string :company, limit: 50, null: false
    end
  end
end
