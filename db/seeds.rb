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
  Genre.create(:id => 1, :name => 'Action')
  Genre.create(:id => 2, :name => 'Adult')
  Genre.create(:id => 3, :name => 'Adventure')
  Genre.create(:id => 4, :name => 'Animation')
  Genre.create(:id => 5, :name => 'Crime')
  Genre.create(:id => 6, :name => 'Comedy')
  Genre.create(:id => 7, :name => 'Documentary')
  Genre.create(:id => 8, :name => 'Drama')
  Genre.create(:id => 9, :name => 'Family')
  Genre.create(:id => 10, :name => 'Fantasy')
  Genre.create(:id => 11, :name => 'Horror')
  Genre.create(:id => 12, :name => 'Musical')
  Genre.create(:id => 13, :name => 'Mystery')
  Genre.create(:id => 14, :name => 'Romance')
  Genre.create(:id => 15, :name => 'Sci-Fi')
  Genre.create(:id => 16, :name => 'Short')
  Genre.create(:id => 17, :name => 'Thriller')
  Genre.create(:id => 18, :name => 'War')
  Genre.create(:id => 19, :name => 'Western')
end

# ActiveRecord::Base.transaction do
#   CSV.foreach("#{seed_path}/movieactor1.csv") do |row|
#
#   end
# end
#
# ActiveRecord::Base.transaction do
#   CSV.foreach("#{seed_path}/moviedirector.csv") do |row|
#
#   end
# end
#
# ActiveRecord::Base.transaction do
#   CSV.foreach("#{seed_path}/moviegenre.csv") do |row|
# end