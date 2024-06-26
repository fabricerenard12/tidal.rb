require 'oauth2'
require 'uri'

module Tidal
  class ClientV1
    BASE_URL = 'https://openapi.tidal.com/v2'.freeze
    TOKEN_URL = 'https://auth.tidal.com/v2/oauth2/token'.freeze

    attr_reader :access_token

    # Initialize the Tidal client
    #
    # @param client_id [String] The client ID for the Tidal API
    # @param client_secret [String] The client secret for the Tidal API
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      @client = OAuth2::Client.new(@client_id, @client_secret, site: BASE_URL, token_url: TOKEN_URL)
      @access_token = @client.client_credentials.get_token.token
    end

    def get_multiple_albums(country_code, include_arr = nil, filter_id = nil, filter_barcode_id = nil)
      uri = URI("#{BASE_URL}/albums/byIds")
      params = { countryCode: country_code }
      params[:include_arr] = include_arr if include_arr
      params[:filter_id] = filter_id if filter_id
      params[:filter_barcode_id] = filter_barcode_id if filter_barcode_id
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_album(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}")
      params = { countryCode: country_code }
      params[:include_arr] = include_arr if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    private

    # Default headers for requests
    #
    # @return [Hash] The default headers
    def default_headers
      {
        'accept' => "application/vnd.tidal.v2+json",
        'Authorization' => "Bearer #{@access_token}",
        'Content-Type' => "application/vnd.tidal.v2+json",
      }
    end
  end
end
