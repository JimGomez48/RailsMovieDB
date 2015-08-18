class Api::V1::DirectorsController < Api::V1::ApiController
  # TODO
  def index
    @directors = Director.all.order(:last, :first, :dob)
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