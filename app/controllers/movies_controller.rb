class MoviesController < ResourceBaseController
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
    @genres = @movie.genres.order(:value)
    @directors = @movie.directors.order(:last, :first)
    @movie_actors = MovieActor.where(:movie_id => params[:id])
    @reviews = Review.where(:movie_id => params[:id])
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
