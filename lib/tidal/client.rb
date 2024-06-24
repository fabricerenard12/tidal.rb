require 'oauth2'

module Tidal
  class Client
    BASE_URL = 'https://api.tidal.com/v1'.freeze
    TOKEN_URL = 'https://auth.tidal.com/v1/oauth2/token'.freeze

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      @client = OAuth2::Client.new(@client_id, @client_secret, site: BASE_URL, token_url: TOKEN_URL)
    end

    def get_access_token
      @client.client_credentials.get_token.token
    end
  end
end
