class MovieActor < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
  has_many :movie_actor_roles

  def as_json(options={})
    super(
        :include => [:actor, :movie_actor_roles],
        :except => [:id, :movie_id, :actor_id]
    )
  end
end
