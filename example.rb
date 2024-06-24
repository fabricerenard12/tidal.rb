require 'tidal'

# Replace with your actual client ID and client secret
client_id = 'xBH98O1UTiWRn5np'
client_secret = 'e5hjNXZEJ294afD7N1ArM5y1tv7jogK0fxbNR0jWlgY='

# Create an instance of TidalOAuthClient
client = Tidal::Client.new(client_id, client_secret)

puts "Access Token: #{client.access_token}"
puts client.get_single_album(251380836, "US")
