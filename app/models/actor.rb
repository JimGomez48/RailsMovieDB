class Actor < ActiveRecord::Base
  has_many :movie_actors
  has_many :movies, :through => :movie_actors

  def full_name
    "#{first} #{last}"
  end

  def movie_actor_role(movie_id)
    self.movie_actors.find_by(:movie_id => movie_id).movie_actor_roles
  end
end
