class MovieActorRole < ActiveRecord::Base
  belongs_to :movie_actor

  def as_json(options={})
    super(:only => :role)
  end
end
