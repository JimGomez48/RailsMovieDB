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
  Genre.create(:id => genre_hash[ACTION], :name => ACTION)
  Genre.create(:id => genre_hash[ADULT], :name => ADULT)
  Genre.create(:id => genre_hash[ADVENTURE], :name => ADVENTURE)
  Genre.create(:id => genre_hash[ANIMATION], :name => ANIMATION)
  Genre.create(:id => genre_hash[CRIME], :name => CRIME)
  Genre.create(:id => genre_hash[COMEDY], :name => COMEDY)
  Genre.create(:id => genre_hash[DOCUMENTARY], :name => DOCUMENTARY)
  Genre.create(:id => genre_hash[DRAMA], :name => DRAMA)
  Genre.create(:id => genre_hash[FAMILY], :name => FAMILY)
  Genre.create(:id => genre_hash[FANTASY], :name => FANTASY)
  Genre.create(:id => genre_hash[HORROR], :name => HORROR)
  Genre.create(:id => genre_hash[MUSICAL], :name => MUSICAL)
  Genre.create(:id => genre_hash[MYSTERY], :name => MYSTERY)
  Genre.create(:id => genre_hash[ROMANCE], :name => ROMANCE)
  Genre.create(:id => genre_hash[SCI_FI], :name => SCI_FI)
  Genre.create(:id => genre_hash[SHORT], :name => SHORT)
  Genre.create(:id => genre_hash[THRILLER], :name => THRILLER)
  Genre.create(:id => genre_hash[WAR], :name => WAR)
  Genre.create(:id => genre_hash[WESTERN], :name => WESTERN)
end

# movie_actors
ActiveRecord::Base.transaction do
  quote_pattern = /'/
  inserts = []
  CSV.foreach("#{seed_path}/movieactor1.csv") do |row|
    id, mid, aid, role = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{mid}, #{aid}, '#{role}')")
  end
  CSV.foreach("#{seed_path}/movieactor2.csv") do |row|
    id, mid, aid, role = row
    role = role.gsub(quote_pattern){ %q('') } if quote_pattern.match(role)
    inserts.push("(#{mid}, #{aid}, '#{role}')")
  end
  sql = "INSERT INTO movie_actors (movie_id, actor_id, role) VALUES #{inserts.join(', ')};"
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

# reviews: test data
ActiveRecord::Base.transaction do
  #       667, 253
  Review.create(
      :username => 'jim',
      :movie_id => '667',
      :rating => 5,
      :comment => 'Great Scorsese film!',
  )
  Review.create(
      :username => 'jimbo',
      :movie_id => '667',
      :rating => 4,
      :comment => 'Awesome',
  )
  Review.create(
      :username => 'jim',
      :movie_id => '253',
      :rating => 5,
      :comment => 'Hilarious!',
  )
  Review.create(
      :username => 'jimbo',
      :movie_id => '253',
      :rating => 3,
      :comment => 'Pretty funny',
  )
end
