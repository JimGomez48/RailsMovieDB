class DirectorsController < ResourceBaseController
  def index
    @directors = Director.all.order(:last, :first, :dob).limit(100).paginate(page: params[:page], per_page: RESULTS_PER_PAGE)
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
    @director = Director.find(params[:id])
    @filmography = @director.movies.order(:title, :year)
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
