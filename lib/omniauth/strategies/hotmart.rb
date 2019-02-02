# frozen_string_literal: true

module OmniAuth
  module Strategies
    class Hotmart < OmniAuth::Strategies::OAuth2
      option :name, 'hotmart'

      option :client_options,
             site: 'https://api-sec-vlc.hotmart.com',
             hot_connect_url: 'https://api-hot-connect.hotmart.com',
             authorize_url: '/security/oauth/authorize',
             response_type: 'code',
             token_url: '/security/oauth/token',
             grant_type: 'authorization_code'

      option :provider_ignores_state, true

      uid { raw_info['id'] }

      info do
        { name: raw_info['name'],
          email: raw_info['email'] }
      end

      extra do
        { raw_info: raw_info }
      end

      private

      def authorize_params
        {}
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def build_access_token
        options.token_params.merge!(headers: { 'Authorization' => basic_auth_header })
        super
      end

      def basic_auth_header
        'Basic ' + client.options[:basic]
      end

      def raw_info
        return @raw_info if @raw_info

        oauth = access_token.get(options.client_options[:hot_connect_url],
                                 '/user/rest/v2/me').parsed

        @raw_info = to_snake_keys(oauth) || {}
      end

      def to_snake_keys(value)
        case value
        when Array
          value.map { |v| to_snake_keys(v) }
        when Hash
          Hash[value.map { |k, v| [k.to_s.underscore, to_snake_keys(v)] }]
        else
          value
        end
      end
    end
  end
end
