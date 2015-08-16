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
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
