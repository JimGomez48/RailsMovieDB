class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last, limit: 50, null: false
      t.string :first, limit: 50, null: false
      t.string :username, limit: 30, null: false
      t.string :email, limit: 100, null:false
      t.string :password, null:false
      t.string :salt, null:false
      t.boolean :active, null:false, default: true

      t.timestamps null: false
    end

    add_index :users, [:last, :first, :username], unique: true
    add_index :users, [:username], unique: true
    add_index :users, [:email], unique: true
  end
end
