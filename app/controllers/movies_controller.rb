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
    mid = params[:id]
    @movie = Movie.find(mid)
    @panel_heading = @movie.cleaned_title
    @genres = @movie.genres.order('name')
    @directors = @movie.directors.order(:last, :first)
    @movie_actors = Actor.joins(:movie_actors)
                        .where('movie_actors.movie_id' => mid)
                        .select('actors.id, actors.last, actors.first, movie_actors.role')
                        .order('actors.last', 'actors.first')
    @reviews = Review.where('movie_id' => mid)
    @avg_rating = @reviews.average('rating')
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
