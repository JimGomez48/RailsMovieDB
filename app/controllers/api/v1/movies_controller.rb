module Api
  module V1
    class MoviesController < ApiController
      def index
        @movies = Movie.all.order(:title, :year)
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
        mid = params[:id]
        @movie = Movie.find(mid)
        @genres = @movie.genres.order('name')
        @directors = @movie.directors.order(:last, :first)
        @movie_actors = Actor.joins(:movie_actors)
                            .where('movie_actors.movie_id' => mid)
                            .select('actors.id, actors.last, actors.first, movie_actors.role')
                            .order('actors.last', 'actors.first')
        @reviews = Review.where('movie_id' => mid)
        render json: [
                   :movie => @movie,
                   :genres => @genres,
                   :directors => @directors,
                   :actors => @movie_actors,
                   :reviews => @reviews
               ]
      end

      def update
        # TODO
      end

      def destroy
        # TODO
      end
    end
  end
end
