
# Tidal

A Ruby wrapper to interact with the Tidal API. This gem provides a Ruby wrapper around the Tidal API, allowing developers to easily interact with Tidal's services, including retrieving album and artist information, searching for tracks, and more.

![Gem Version](https://badge.fury.io/rb/tidal.svg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tidal'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install tidal
```

## Usage

### Configuration

First, you need to initialize the client with your Tidal API credentials.

```ruby
require 'tidal'

client_id = 'your_client_id'
client_secret = 'your_client_secret'
client = Tidal::ClientV1.new(client_id, client_secret)
```

### Fetch Albums by Barcode ID

```ruby
barcode_id = '123456789'
country_code = 'US'
albums = client.get_albums_by_barcode_id(barcode_id, country_code)
```

### Fetch Multiple Albums by IDs

```ruby
album_ids = ['123', '456', '789']
country_code = 'US'
albums = client.get_multiple_albums(album_ids, country_code)
```

### Fetch Album Items

```ruby
album_id = '123'
country_code = 'US'
items = client.get_album_items(album_id, country_code)
```

### Fetch Similar Albums

```ruby
album_id = '123'
country_code = 'US'
similar_albums = client.get_similar_albums(album_id, country_code)
```

### Fetch Single Album

```ruby
album_id = '123'
country_code = 'US'
album = client.get_single_album(album_id, country_code)
```

### Fetch Albums by Artist

```ruby
artist_id = '1234'
country_code = 'US'
albums = client.get_albums_by_artist(artist_id, country_code)
```

### Fetch Multiple Artists by IDs

```ruby
artist_ids = ['123', '456', '789']
country_code = 'US'
artists = client.get_multiple_artists(artist_ids, country_code)
```

### Fetch Similar Artists

```ruby
artist_id = '1234'
country_code = 'US'
similar_artists = client.get_similar_artists(artist_id, country_code)
```

### Fetch Single Artist

```ruby
artist_id = '1234'
country_code = 'US'
artist = client.get_single_artist(artist_id, country_code)
```

### Fetch Tracks by Artist

```ruby
artist_id = '1234'
country_code = 'US'
tracks = client.get_tracks_by_artist(artist_id, country_code)
```

### Fetch Multiple Tracks by IDs

```ruby
track_ids = ['123', '456', '789']
country_code = 'US'
tracks = client.get_multiple_tracks(track_ids, country_code)
```

### Fetch Tracks by ISRC

```ruby
isrc = 'US1234567890'
country_code = 'US'
tracks = client.get_tracks_by_isrc(isrc, country_code)
```

### Fetch Single Track

```ruby
track_id = '1234'
country_code = 'US'
track = client.get_single_track(track_id, country_code)
```

### Fetch Similar Tracks

```ruby
track_id = '1234'
country_code = 'US'
similar_tracks = client.get_similar_tracks(track_id, country_code)
```

### Fetch Multiple Videos by IDs

```ruby
video_ids = ['123', '456', '789']
country_code = 'US'
videos = client.get_multiple_videos(video_ids, country_code)
```

### Fetch Single Video

```ruby
video_id = '1234'
country_code = 'US'
video = client.get_single_video(video_id, country_code)
```

### Search

```ruby
query = 'Shape of You'
country_code = 'US'
search_results = client.get_search(query, country_code)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tidal.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).