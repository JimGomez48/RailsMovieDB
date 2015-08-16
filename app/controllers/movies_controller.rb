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
    mid = params[:id]
    @movie = Movie.find(mid)
    @panel_heading = @movie.cleaned_title
    @genres = @movie.genres.order('name')
    @directors = @movie.directors.order(:last, :first)
    @movie_actors = Actor.joins(:movie_actors)
                        .where('movie_actors.movie_id' => mid)
                        .select('actors.id, actors.last, actors.first, movie_actors.role')
                        .order('actors.last', 'actors.first')
    @reviews = Review.where('movie_id' => mid)
    @avg_rating = @reviews.average('rating')
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
