class Api::V1::ActorsController < Api::V1::ApiController
  def index
    @actors = Actor.all.order(:last, :first, :dob)
    @status = SUCCESS
    @code = nil
  end

  def new
    # TODO
  end

  def create
    # TODO
  end

  def edit
    # TODO
  end

  def show
    @actor = Actor.find(params[:id])
    @movies = Movie.joins(:movie_actors)
                       .where('movie_actors.actor_id' => params[:id])
                       .select('movies.id', 'movies.title', 'movies.year', 'movies.rating', 'movies.company', 'movie_actors.role')
                       .order('movies.year DESC', 'movies.title')
    @status = SUCCESS
    @code = nil
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end