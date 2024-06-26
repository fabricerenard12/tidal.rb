require 'oauth2'
require 'uri'

module Tidal
  class ClientV1
    BASE_URL = 'https://openapi.tidal.com/'.freeze
    TOKEN_URL = 'https://auth.tidal.com/v1/oauth2/token'.freeze

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

    # Get albums by barcode ID
    #
    # @param barcode_id [String] The barcode ID
    # @param country_code [String] The country code
    # @return [Array] The list of albums
    def get_albums_by_barcode_id(barcode_id, country_code)
      uri = URI("#{BASE_URL}/albums/byBarcodeId")
      params = { barcodeId: barcode_id, countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get multiple albums
    #
    # @param ids [Array] The array of album IDs
    # @param country_code [String] The country code
    # @return [Array] The list of albums
    def get_multiple_albums(ids, country_code)
      uri = URI("#{BASE_URL}/albums/byIds")
      params = { ids: ids.join(','), countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get album items
    #
    # @param album_id [String] The album ID
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of album items
    def get_album_items(album_id, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/items")
      params = { countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get similar albums
    #
    # @param album_id [String] The album ID
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of similar albums
    def get_similar_albums(album_id, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/similar")
      params = { countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get a single album
    #
    # @param album_id [String] The album ID
    # @param country_code [String] The country code
    # @return [Hash] The album data
    def get_single_album(album_id, country_code)
      uri = URI("#{BASE_URL}/albums/#{album_id}")
      params = { countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get albums by artist
    #
    # @param artist_id [String] The artist ID
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of albums by the artist
    def get_albums_by_artist(artist_id, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/albums")
      params = { countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get multiple artists
    #
    # @param ids [Array] The array of artist IDs
    # @param country_code [String] The country code
    # @return [Array] The list of artists
    def get_multiple_artists(ids, country_code)
      uri = URI("#{BASE_URL}/artists")
      params = { ids: ids.join(','), countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get similar artists
    #
    # @param artist_id [String] The artist ID
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of similar artists
    def get_similar_artists(artist_id, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/similar")
      params = { countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get a single artist
    #
    # @param artist_id [String] The artist ID
    # @param country_code [String] The country code
    # @return [Hash] The artist data
    def get_single_artist(artist_id, country_code)
      uri = URI("#{BASE_URL}/artists/#{artist_id}")
      params = { countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get tracks by artist
    #
    # @param artist_id [String] The artist ID
    # @param country_code [String] The country code
    # @param collapse_by [String, nil] The collapse criteria
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of tracks by the artist
    def get_tracks_by_artist(artist_id, country_code, collapse_by = nil, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/tracks")
      params = { countryCode: country_code }
      params[:collapseBy] = collapse_by if collapse_by
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get multiple tracks
    #
    # @param ids [Array] The array of track IDs
    # @param country_code [String] The country code
    # @return [Array] The list of tracks
    def get_multiple_tracks(ids, country_code)
      uri = URI("#{BASE_URL}/tracks")
      params = { ids: ids.join(','), countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get tracks by ISRC
    #
    # @param isrc [String] The ISRC code
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of tracks by ISRC
    def get_tracks_by_isrc(isrc, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/tracks/byIsrc")
      params = { isrc: isrc, countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get a single track
    #
    # @param artist_id [String] The artist ID
    # @param country_code [String] The country code
    # @return [Hash] The track data
    def get_single_track(artist_id, country_code)
      uri = URI("#{BASE_URL}/tracks/#{artist_id}")
      params = { countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get similar tracks
    #
    # @param track_id [String] The track ID
    # @param country_code [String] The country code
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Array] The list of similar tracks
    def get_similar_tracks(track_id, country_code, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}/similar")
      params = { countryCode: country_code }
      params[:offset] = offset if offset
      params[:limit] = limit if limit
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get multiple videos
    #
    # @param ids [Array] The array of video IDs
    # @param country_code [String] The country code
    # @return [Array] The list of videos
    def get_multiple_videos(ids, country_code)
      uri = URI("#{BASE_URL}/videos")
      params = { ids: ids.join(','), countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Get a single video
    #
    # @param video_id [String] The video ID
    # @param country_code [String] The country code
    # @return [Hash] The video data
    def get_single_video(video_id, country_code)
      uri = URI("#{BASE_URL}/videos/#{video_id}")
      params = { countryCode: country_code }
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    # Search for content
    #
    # @param query [String] The search query
    # @param country_code [String] The country code
    # @param type [String, nil] The type of content to search for
    # @param popularity [String, nil] The popularity filter
    # @param offset [Integer, nil] The offset for pagination
    # @param limit [Integer, nil] The limit for pagination
    # @return [Hash] The search results
    def get_search(query, country_code, type = nil, popularity = nil, offset = nil, limit = nil)
      uri = URI("#{BASE_URL}/search")
      params = { query: query, countryCode: country_code }
      params[:type] = type if type
      params[:popularity] = popularity if popularity
      params[:offset] = offset if offset
      params[:limit] = limit if limit
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
        'accept' => "application/vnd.tidal.v1+json",
        'Authorization' => "Bearer #{@access_token}",
        'Content-Type' => "application/vnd.tidal.v1+json",
      }
    end
  end
end
