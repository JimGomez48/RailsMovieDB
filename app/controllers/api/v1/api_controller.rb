module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::ImplicitRender
      include ActionController::Helpers
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      # protect_from_forgery with: :null_session

      # status codes
      SUCCESS = 'success' # All's good. Return valid data response
      FAIL    = 'fail'    # Invalid request of validation fail. Return a hash of validation errors
      ERROR   = 'error'   # Something went wrong on the server.
      # pagination
      DEFAULT_PER_PAGE = 20

      protected
      def exception_to_error_code(exception)
        case exception
          when 'a' then
            1
        end
      end

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
        if @pagination[:current_page] < 0 || @pagination[:current_page] > @pagination[:total_pages]
          raise ArgumentError,
                "Invalid value for page => Page: #{@pagination[:current_page]}, TotalPages: #{@pagination[:total_pages]}"
        end
        if @pagination[:items_per_page] < 0 || @pagination[:items_per_page] > @pagination[:total_items]
          raise ArgumentError,
                "Invalid value for ResultsPerPage => ResultsPerPage: #{@pagination[:items_per_page]}, TotalItems: #{@pagination[:total_items]}"
        end
      end
    end
  end
end
