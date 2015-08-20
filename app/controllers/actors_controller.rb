class ActorsController < ResourceBaseController
  def index
    @actors = Actor.all
                  .order(:last, :first, :dob).limit(100)
                  .paginate(page: params[:page], per_page: RESULTS_PER_PAGE)
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
    @movie_entries = []
    movie_actors = MovieActor.where(:actor_id => params[:id])
    movie_actors.each do |movie_actor|
      @movie_entries.append({:movie => movie_actor.movie, :roles => movie_actor.movie_actor_roles})
    end
    # sort movies_actors by year DESC, title ASC
    @movie_entries = @movie_entries.sort_by { |a| a[:movie].year }.reverse
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
