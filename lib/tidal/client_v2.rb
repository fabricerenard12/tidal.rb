require 'oauth2'
require 'uri'
require 'json'

module Tidal
  class ClientV2
    BASE_URL = 'https://openapi.tidal.com/v2/'.freeze
    TOKEN_URL = 'https://auth.tidal.com/v1/oauth2/token'.freeze

    attr_reader :access_token

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
      @client = OAuth2::Client.new(@client_id, @client_secret, site: BASE_URL, token_url: TOKEN_URL)
      @access_token = @client.client_credentials.get_token.token
      puts @access_token
    end

    def get_multiple_albums(country_code, include_arr = nil, filter_id = nil, filter_barcode_id = nil)
      uri = URI("#{BASE_URL}/albums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      params[:'filter[id]'] = filter_id.join(',') if filter_id
      params[:'filter[barcodeId]'] = filter_barcode_id.join(',') if filter_barcode_id
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_album(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_artist_details_of_album(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/relationships/artists")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_album_item_details(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/relationships/items")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_album_providers(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/relationships/providers")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_similar_albums(album_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/albums/#{album_id}/relationships/similarAlbums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_multiple_artists(country_code, include_arr = nil, filter_id = nil)
      uri = URI("#{BASE_URL}/artists")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      params[:'filter[id]'] = filter_id.join(',') if filter_id
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_artist(artist_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_album_details_of_artist(artist_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/relationships/albums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_similar_artists(artist_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/relationships/similarArtists")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_track_details_of_artist(artist_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/relationships/tracks")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_video_details_of_artist(artist_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/artists/#{artist_id}/relationships/videos")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_multiple_tracks(country_code, include_arr = nil, filter_id = nil, filter_isrc = nil)
      uri = URI("#{BASE_URL}/tracks")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      params[:'filter[id]'] = filter_id.join(',') if filter_id
      params[:'filter[isrc]'] = filter_isrc.join(',') if filter_isrc
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_track(track_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_album_details_of_track(track_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}/relationships/albums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_artist_details_of_track(track_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}/relationships/artists")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_providers_of_track(track_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}/relationships/providers")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_similar_tracks(track_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/tracks/#{track_id}/relationships/similarTracks")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_multiple_videos(country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/videos")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_video(video_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/videos/#{video_id}")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_album_details_of_video(video_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/videos/#{video_id}/relationships/albums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_artist_details_of_video(video_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/videos/#{video_id}/relationships/artists")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_providers_of_video(video_id, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/videos/#{video_id}/relationships/providers")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_multiple_providers(include_arr = nil, filter_id = nil)
      uri = URI("#{BASE_URL}/providers")
      params = {}
      params[:include] = include_arr.join(',') if include_arr
      params[:'filter[id]'] = filter_id.join(',') if filter_id
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_single_provider(provider_id, include_arr = nil)
      uri = URI("#{BASE_URL}/providers/#{provider_id}")
      params = {}
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end


    def get_search_music_metadata(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_search_albums(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}/relationships/albums")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_search_artists(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}/relationships/artists")
      params = { query: query, countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_search_top_hits(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}/relationships/topHits")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_search_tracks(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}/relationships/tracks")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_search_videos(query, country_code, include_arr = nil)
      uri = URI("#{BASE_URL}/searchresults/#{query}/relationships/videos")
      params = { countryCode: country_code }
      params[:include] = include_arr.join(',') if include_arr
      uri.query = URI.encode_www_form(params)

      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_current_user
      uri = URI("#{BASE_URL}/users/me")
      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    def get_user(user_id)
      uri = URI("#{BASE_URL}/users/#{user_id}")
      response = @client.request(:get, uri.to_s, headers: default_headers)
      JSON.parse(response.body)
    end

    private

    def default_headers
      {
        'accept' => 'application/vnd.api+json',
        'Authorization' => "Bearer #{@access_token}",
        'Content-Type' => 'application/vnd.api+json',
      }
    end
  end
end
