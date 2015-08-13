require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_path = Rails.root.join('db', 'seeds')

ActiveRecord::Base.transaction do
  CSV.foreach("#{seed_path}/movie.csv") do |row|
    Movie.create(
        :id => row[0],
        :title => row[1],
        :year => row[2],
        :rating => row[3],
        :company => row[4],
    )
  end
end

ActiveRecord::Base.transaction do
  CSV.foreach("#{seed_path}/actor1.csv") do |row|
    Actor.create(
        :id => row[0],
        :last => row[1],
        :first => row[2],
        :sex => row[3],
        :dob => row[4],
        :dod => row[5],
    )
  end
  CSV.foreach("#{seed_path}/actor2.csv") do |row|
    Actor.create(
        :id => row[0],
        :last => row[1],
        :first => row[2],
        :sex => row[3],
        :dob => row[4],
        :dod => row[5],
    )
  end
  CSV.foreach("#{seed_path}/actor3.csv") do |row|
    Actor.create(
        :id => row[0],
        :last => row[1],
        :first => row[2],
        :sex => row[3],
        :dob => row[4],
        :dod => row[5],
    )
  end
end

ActiveRecord::Base.transaction do
  CSV.foreach("#{seed_path}/director.csv") do |row|
    Director.create(
        :id => row[0],
        :last => row[1],
        :first => row[2],
        :dob => row[3],
        :dod => row[4],
    )
  end
end

ActiveRecord::Base.transaction do
#   genre
end

ActiveRecord::Base.transaction do
#   movieactor
end

ActiveRecord::Base.transaction do
#   moviedirector
end

ActiveRecord::Base.transaction do
#   moviegenre
end