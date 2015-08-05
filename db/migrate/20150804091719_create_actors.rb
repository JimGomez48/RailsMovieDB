class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :last, limit: 50, null: false
      t.string :first, limit: 50, null: false
      t.string :sex, limit: 6, null: false
      t.date :dob, null:false
      t.date :dod, null:true
    end
  end
end
