module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::ImplicitRender
      include ActionController::Helpers
      include Errors::RescueError

      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      # protect_from_forgery with: :null_session

      # pagination
      DEFAULT_PER_PAGE = 20

      def generate_pagination(collection, count, per_page)
        @pagination = {
            :current_page   => collection.current_page,
            :total_pages    => collection.total_pages,
            :total_items    => count,
            :items_per_page => per_page
        }
        validate_pagination
        @pagination
      end

      private
      def validate_pagination
        if @pagination[:current_page] < 1 || @pagination[:current_page] > @pagination[:total_pages]
          raise Errors::RangeNotSatisfiableError, {:page => 'Invalid value', :pagination => @pagination}
        end
        if @pagination[:items_per_page] < 1 || @pagination[:items_per_page] > @pagination[:total_items]
          raise Errors::RangeNotSatisfiableError, {:results_per_page => 'Invalid value', :pagination => @pagination}
        end
      end
    end
  end
end
