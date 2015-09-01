class Api::V1::DirectorsController < Api::V1::ApiController
  def index
    if params[:page].nil?
      @directors = Director.all.order(:last, :first, :dob)
    else
      if params[:results_per_page]
        per_page = params[:results_per_page].to_i
      else
        per_page = DEFAULT_PER_PAGE
      end
      @directors = Director.all.order(:last, :first, :dob).paginate(page: params[:page], per_page: per_page)

      generate_pagination(@directors, Director.count, per_page)
    end
    @status = SUCCESS
    @code = nil
  end

  def new

  end

  def create

  end

  def edit

  end

  def show
    @director = Director.find(params[:id])
    @movies = @director.movies
    @status = SUCCESS
    @code = nil
  end

  def update

  end

  def destroy

  end
end