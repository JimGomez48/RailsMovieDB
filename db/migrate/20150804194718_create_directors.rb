class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :last, limit: 50, null: false
      t.string :first, limit: 50, null: false
      t.date :dob, null: false
      t.date :dod, null: true
    end
  end
end
