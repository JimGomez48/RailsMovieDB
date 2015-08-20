module Api
  module V1
    class ApiController < ActionController::API
      include ActionController::ImplicitRender
      include ActionController::Helpers
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      # protect_from_forgery with: :null_session

      # status codes
      SUCCESS = 'success'
      FAIL = 'fail'
      ERROR = 'error'
      # pagination
      RESULTS_PER_PAGE = 20

      private
      def exception_to_error_code(exception)
        case exception
          when 'a' then
            1
        end
      end
    end
  end
end
