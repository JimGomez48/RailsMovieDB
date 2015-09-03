class Api::V1::MoviesController < Api::V1::ApiController
  def index
    if params[:page].nil?
      @movies = Movie.all.order(:title, :year)
    else
      if params[:results_per_page]
        per_page = params[:results_per_page].to_i
      else
        per_page = DEFAULT_PER_PAGE
      end
      @movies = Movie.all.order(:title, :year).paginate(page: params[:page], per_page: per_page)
      generate_pagination(@movies, Movie.count, per_page)
    end
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
