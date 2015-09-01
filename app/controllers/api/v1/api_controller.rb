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
        return @pagination
      end
    end
  end
end
