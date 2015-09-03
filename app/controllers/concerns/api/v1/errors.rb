module Api
  module V1
    module Errors
      # 400 errors
      class ApiError < StandardError;
        attr_reader :code

        def initialize(msg)
          super(msg)
          @code = nil
        end
      end

      class AuthenticationError < ApiError
        def initialize(msg)
          super(msg)
          @code = 401
        end
      end

      class NotFoundError < ApiError
        def initialize(msg)
          super(msg)
          @code = 404
        end
      end

      class MethodNotAllowedError < ApiError
        def initialize(msg)
          super(msg)
          @code = 405
        end
      end

      class LengthRequiredError < ApiError
        def initialize(msg)
          super(msg)
          @code = 411
        end
      end

      class RangeNotSatisfiableError < ApiError
        def initialize(msg)
          super(msg)
          @code = 416
        end
      end


      # 500 errors
      class InternalServerError < ApiError
        def initialize(msg)
          super(msg)
          @code = 500
        end
      end

      class NotImplementedError < ApiError
        def initialize(msg)
          super(msg)
          @code = 501
        end
      end

      class UnavailableError < ApiError
        def initialize(msg)
          super(msg)
          @code = 503
        end
      end

      module RescueError
        def self.included(base)
          base.rescue_from Errors::ApiError do |e|
            render :json => {:status => 'error', :message => e.message, :code => e.code}, status: e.code
          end
        end
      end
    end
  end
end