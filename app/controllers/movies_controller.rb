class MoviesController < ResourceBaseController
  def index
    @movies = Movie.all.order(:title, :year).paginate(page: params[:page], per_page: RESULTS_PER_PAGE)
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
    @avg_rating = @avg_rating = @reviews.average(:rating)
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
