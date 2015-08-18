module Api
  module V1
    class Api::V1::ApiController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.

      # status values
      SUCCESS = 'success'
      FAIL = 'fail'
      ERROR = 'error'

      protect_from_forgery with: :null_session

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
