class Movie < ActiveRecord::Base
  has_many :movie_actors
  has_many :actors, :through => :movie_actors
  has_many :movie_directors
  has_many :directors, :through => :movie_directors
  has_many :movie_genres
  has_many :genres, :through => :movie_genres

  ## If title ends with ', The', remove it from the end and prepend 'The ' to the title
  def cleaned_title
    pattern = /, The$/i
    return "The #{title.sub(pattern, '')}" if pattern.match(title)
    return title
  end

  # return a db-safe copy of the current title
  def to_db_title
    pattern = /^The /i
    return "#{title.sub(pattern, '')}, The" if pattern.match(title)
    return title
  end

  # modify the movie title in place such that it is db-safe
  def to_db_title!
    pattern = /^The /i
    self.title = "#{title.sub(pattern, '')}, The" if pattern.match(title)
    return self.title
  end
end
