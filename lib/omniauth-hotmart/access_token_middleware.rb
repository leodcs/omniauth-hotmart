# frozen_string_literal: true

require 'multi_json'

module OmniAuth
  module Hotmart
    class AccessTokenMiddleware
      attr_reader :options

      def initialize(app, options = {})
        @app = app
        @options = options
      end

      def call(request_env)
        if request_env.url.path == '/security/oauth/token'
          @app.call(request_env).on_complete do |response_env|
            response_env.body = MultiJson.dump(MultiJson.load(response_env.body)['TokenResponse'])
          end
        else
          @app.call(request_env)
        end
      end
    end
  end
end
