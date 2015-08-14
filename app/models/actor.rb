class Actor < ActiveRecord::Base
  has_many :movie_actors
  has_many :movies, :through => :movie_actors

  def full_name
    "#{first} #{last}"
  end
end
