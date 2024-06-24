require 'oauth2'

module Tidal
  class Client
    BASE_URL = 'https://openapi.tidal.com/'.freeze
    TOKEN_URL = 'https://auth.tidal.com/v1/oauth2/token'.freeze

    attr_reader :access_token

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      @client = OAuth2::Client.new(@client_id, @client_secret, site: BASE_URL, token_url: TOKEN_URL)
      @access_token = @client.client_credentials.get_token.token
    end

    def get_single_album(album_id, country_code)
      response = @client.request(:get, "#{BASE_URL}/albums/#{album_id}?countryCode=#{country_code}", headers: default_headers)
      JSON.parse(response.body)
    end

    private

    def default_headers
      {
        'accept' => "application/vnd.tidal.v1+json",
        'Authorization' => "Bearer #{@access_token}",
        'Content-Type' => "application/vnd.tidal.v1+json",
      }
    end
  end
end
