module Api
  module V1
    module Errors
      # 400 errors
      class ClientError < StandardError;
        attr_reader :code
        attr_reader :errors

        def initialize(code, errors)
          @code = code
          @errors = errors
        end
      end

      class AuthenticationError < ClientError
        def initialize(errors)
          super(401, errors)
        end
      end

      class NotFoundError < ClientError
        def initialize(errors)
          super(404, errors)
        end
      end

      class MethodNotAllowedError < ClientError
        def initialize(errors)
          super(405, errors)
        end
      end

      class LengthRequiredError < ClientError
        def initialize(errors)
          super(411, errors)
          @code = 411
        end
      end

      class RangeNotSatisfiableError < ClientError
        def initialize(errors)
          super(416, errors)
        end
      end

      # 500 errors
      class ServerError < StandardError;
        attr_reader :code

        def initialize(code, msg)
          super(msg)
          @code = code
        end
      end

      class InternalServerError < ServerError
        def initialize(msg)
          super(500, msg)
        end
      end

      class NotImplementedError < ServerError
        def initialize(msg)
          super(501, msg)
        end
      end

      class UnavailableError < ServerError
        def initialize(msg)
          super(503, msg)
        end
      end

      module RescueError
        def self.included(base)
          base.rescue_from Errors::ClientError do |e|
            render :json => {:status => 'fail', :data => e.errors, :code => e.code}, status: e.code
          end

          base.rescue_from Errors::ServerError do |e|
            render :json => {:status => 'error', :message => e.message, :code => e.code}, status: e.code
          end
        end
      end
    end
  end
end