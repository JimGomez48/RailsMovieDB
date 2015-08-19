class Api::V1::MoviesController < Api::V1::ApiController
  def index
    @movies = Movie.all.order(:title, :year)
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
    @movie = Movie.find(params[:id])
    @genres = @movie.genres.order('value')
    @directors = @movie.directors.order(:last, :first)
    @movie_actors = MovieActor.where(:movie_id => params[:id])
    # @movie_actors.actor
    # @movie_actors.each do |movie_actor|
    #   movie_actor.movie_actor_roles
    # end
    # @movie_actors = Actor.joins(:movie_actors)
    #                     .where('movie_actors.movie_id' => params[:id])
    #                     .select('actors.id, actors.last, actors.first, movie_actors.role')
    #                     .order('actors.last', 'actors.first')
    @reviews = Review.where('movie_id' => params[:id])
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
