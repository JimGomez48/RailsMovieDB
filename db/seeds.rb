require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_path = Rails.root.join('db', 'seeds')
connection = ActiveRecord::Base.connection

# users
ActiveRecord::Base.transaction do
  User.create(
      :last => 'admin',
      :first => 'admin',
      :username => 'admin',
      :email => 'admin@test.com',
      :password => 'test',
      :salt => 'salt',
  )
  User.create(
      :last => 'Gomez',
      :first => 'Jim',
      :username => 'jimbo1',
      :email => 'jg1@test.com',
      :password => 'test',
      :salt => 'salt',
  )
  User.create(
      :last => 'Gomez',
      :first => 'Jim',
      :username => 'jimbo2',
      :email => 'jg2@test.com',
      :password => 'test',
      :salt => 'salt',
  )
end


# mpaa_ratings
G     = 'G'
PG    = 'PG'
PG_13 = 'PG-13'
R     = 'R'
NC_17 = 'NC-17'
SURR  = 'surrendered'

mpaa_ratings_hash = {
    G     => 1,
    PG    => 2,
    PG_13 => 3,
    R     => 4,
    NC_17 => 5,
    SURR  => 6,
}

ActiveRecord::Base.transaction do
  MpaaRating.create(:id => mpaa_ratings_hash[G], :value => G)
  MpaaRating.create(:id => mpaa_ratings_hash[PG], :value => PG)
  MpaaRating.create(:id => mpaa_ratings_hash[PG_13], :value => PG_13)
  MpaaRating.create(:id => mpaa_ratings_hash[R], :value => R)
  MpaaRating.create(:id => mpaa_ratings_hash[NC_17], :value => NC_17)
  MpaaRating.create(:id => mpaa_ratings_hash[SURR], :value => SURR)
end


# movies
ActiveRecord::Base.transaction do
  sql = "
    BEGIN;
      COPY movies
      FROM '#{seed_path}/movie.csv'
      DELIMITER ',' CSV
      NULL '\\N';
    END;
  "
  connection.execute(sql)
end


# actors
ActiveRecord::Base.transaction do
  sql = "
    BEGIN;
      COPY actors
      FROM '#{seed_path}/actor1.csv'
      DELIMITER ',' CSV
      NULL '\\N';
    END;

    BEGIN;
      COPY actors
      FROM '#{seed_path}/actor2.csv'
      DELIMITER ',' CSV
      NULL '\\N';
    END;

    BEGIN;
      COPY actors
      FROM '#{seed_path}/actor3.csv'
      DELIMITER ',' CSV
      NULL '\\N';
    END;
  "
  connection.execute(sql)
end


# directors
ActiveRecord::Base.transaction do
  sql = "
    BEGIN;
      COPY directors
      FROM '#{seed_path}/director.csv'
      DELIMITER ',' CSV
      NULL '\\N';
    END;
  "
  connection.execute(sql)
end


# genres
ACTION      = 'Action'
ADULT       = 'Adult'
ADVENTURE   = 'Adventure'
ANIMATION   = 'Animation'
CRIME       = 'Crime'
COMEDY      = 'Comedy'
DOCUMENTARY = 'Documentary'
DRAMA       = 'Drama'
FAMILY      = 'Family'
FANTASY     = 'Fantasy'
HORROR      = 'Horror'
MUSICAL     = 'Musical'
MYSTERY     = 'Mystery'
ROMANCE     = 'Romance'
SCI_FI      = 'Sci-Fi'
SHORT       = 'Short'
THRILLER    = 'Thriller'
WAR         = 'War'
WESTERN     = 'Western'

genre_hash = {
    ACTION      => 1,
    ADULT       => 2 ,
    ADVENTURE   => 3,
    ANIMATION   => 4,
    CRIME       => 5,
    COMEDY      => 6,
    DOCUMENTARY => 7,
    DRAMA       => 8,
    FAMILY      => 9,
    FANTASY     => 10,
    HORROR      => 11,
    MUSICAL     => 12,
    MYSTERY     => 13,
    ROMANCE     => 14,
    SCI_FI      => 15,
    SHORT       => 16,
    THRILLER    => 17,
    WAR         => 18,
    WESTERN     => 19,
}

ActiveRecord::Base.transaction do
  Genre.create(:id => genre_hash[ACTION], :value => ACTION)
  Genre.create(:id => genre_hash[ADULT], :value => ADULT)
  Genre.create(:id => genre_hash[ADVENTURE], :value => ADVENTURE)
  Genre.create(:id => genre_hash[ANIMATION], :value => ANIMATION)
  Genre.create(:id => genre_hash[CRIME], :value => CRIME)
  Genre.create(:id => genre_hash[COMEDY], :value => COMEDY)
  Genre.create(:id => genre_hash[DOCUMENTARY], :value => DOCUMENTARY)
  Genre.create(:id => genre_hash[DRAMA], :value => DRAMA)
  Genre.create(:id => genre_hash[FAMILY], :value => FAMILY)
  Genre.create(:id => genre_hash[FANTASY], :value => FANTASY)
  Genre.create(:id => genre_hash[HORROR], :value => HORROR)
  Genre.create(:id => genre_hash[MUSICAL], :value => MUSICAL)
  Genre.create(:id => genre_hash[MYSTERY], :value => MYSTERY)
  Genre.create(:id => genre_hash[ROMANCE], :value => ROMANCE)
  Genre.create(:id => genre_hash[SCI_FI], :value => SCI_FI)
  Genre.create(:id => genre_hash[SHORT], :value => SHORT)
  Genre.create(:id => genre_hash[THRILLER], :value => THRILLER)
  Genre.create(:id => genre_hash[WAR], :value => WAR)
  Genre.create(:id => genre_hash[WESTERN], :value => WESTERN)
end


# movie_actors
ActiveRecord::Base.transaction do
  quote_pattern = /'/
  inserts = []
  CSV.foreach("#{seed_path}/movieactor1.csv") do |row|
    mid, aid = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{mid}, #{aid})")
  end
  CSV.foreach("#{seed_path}/movieactor2.csv") do |row|
    mid, aid = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{mid}, #{aid})")
  end
  sql = "INSERT INTO movie_actors (movie_id, actor_id) VALUES #{inserts.join(', ')};"
  connection.execute(sql)
end


# movie_actor_roles
ActiveRecord::Base.transaction do
  quote_pattern = /'/
  inserts = []
  CSV.foreach("#{seed_path}/movieactorrole1.csv") do |row|
    movie_actor_id, role = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{movie_actor_id}, '#{role}')")
  end
  CSV.foreach("#{seed_path}/movieactorrole2.csv") do |row|
    movie_actor_id, role = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{movie_actor_id}, '#{role}')")
  end
  sql = "INSERT INTO movie_actor_roles (movie_actor_id, role) VALUES #{inserts.join(', ')};"
  connection.execute(sql)
end


# movie_directors
ActiveRecord::Base.transaction do
  inserts = []
  CSV.foreach("#{seed_path}/moviedirector.csv") do |row|
    id, mid, did = row
    inserts.push("(#{mid}, #{did})")
  end
  sql = "INSERT INTO movie_directors (movie_id, director_id) VALUES #{inserts.join(', ')};"
  connection.execute(sql)
end


# movie_genres
ActiveRecord::Base.transaction do
  inserts = []
  CSV.foreach("#{seed_path}/moviegenre.csv") do |row|
    id, mid, genre = row
    genre_id = genre_hash[genre]
    inserts.push("(#{mid}, #{genre_id})")
  end
  sql = "INSERT INTO movie_genres (movie_id, genre_id) VALUES #{inserts.join(', ')};"
  connection.execute(sql)
end


# reviews
ActiveRecord::Base.transaction do
  Review.create(
      # :user_id => User.where(:username => 'jimbo1').select(:id),
      :user_id => 2,
      :movie_id => '667',
      :rating => 5,
      :comment => 'Great Scorsese film!',
  )
  Review.create(
      # :user_id => User.where(:username => 'jimbo2').select(:id),
      :user_id => 3,
      :movie_id => '667',
      :rating => 4,
      :comment => 'Awesome',
  )
  Review.create(
      # :user_id => User.where(:username => 'jimbo1'),
      :user_id => 2,
      :movie_id => '253',
      :rating => 5,
      :comment => 'Hilarious!',
  )
  Review.create(
      # :user_id => User.where(:username => 'jimbo2').select(:id),
      :user_id => 3,
      :movie_id => '253',
      :rating => 3,
      :comment => 'Pretty funny',
  )
end
