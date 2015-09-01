class Api::V1::ActorsController < Api::V1::ApiController
  def index
    if params[:page].nil?
      @actors = Actor.all.order(:last, :first, :dob)
    else
      if params[:results_per_page]
        per_page = params[:results_per_page].to_i
      else
        per_page = DEFAULT_PER_PAGE
      end
      @actors = Actor.all.order(:last, :first, :dob).paginate(page: params[:page], per_page: per_page)
      generate_pagination(@actors, Actor.count, per_page)
    end
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