class MovieActor < ActiveRecord::Base
  belongs_to :movie, -> {order 'title, year'}
  belongs_to :actor, -> {order 'last, first, dob'}
  has_many :movie_actor_roles, -> {order 'role'}

  def as_json(options={})
    super(
        :include => [:actor, :movie_actor_roles],
        :except => [:id, :movie_id, :actor_id]
    )
  end
end
