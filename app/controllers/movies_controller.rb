class MoviesController < ApplicationController
  layout :resolve_layout

  def index
    @movies = Movie.all.order(:title, :year)
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
    @panel_heading = @movie.title
    @genres = [1,1,1]
    @directors = [1,1,1]
    @actors = [1,1,1]
    @reviews = [1,1,1]
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private
  def resolve_layout
    case action_name
      when 'index'    then 'browse_base'
      when 'new'      then 'form_base'
      when 'create'   then 'application'
      when 'edit'     then 'application'
      when 'show'     then 'show_base'
      when 'update'   then 'application'
      when 'destroy'  then 'application'
    end
  end
end
