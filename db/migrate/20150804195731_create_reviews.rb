class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :username, limit: 20, null: false
      t.integer :mid, null: false
      t.integer :rating, limit: 1, null: false
      t.text :comment, limit: 2000, null: true

      t.timestamps null: false
    end

    add_foreign_key :reviews, :movies, column: :mid, primary_key: 'id', on_delete: :cascade
  end
end
