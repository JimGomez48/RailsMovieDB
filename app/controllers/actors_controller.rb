class ActorsController < ResourceBaseController
  def index
    @actors = Actor.all.order(:last, :first, :dob).limit(100).paginate(page: params[:page], per_page: RESULTS_PER_PAGE)
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
    @filmography = Movie.joins(:movie_actors)
                       .where('movie_actors.actor_id' => params[:id])
                       .select('movies.id', 'movies.title', 'movies.year', 'movie_actors.role')
                       .order('movies.year DESC', 'movies.title')
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
