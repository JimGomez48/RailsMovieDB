class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: @movies
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
    @movies = Movie.all
    render json: @movies
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
