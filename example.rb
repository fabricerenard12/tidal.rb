require 'tidal'

# Replace with your actual client ID and client secret
client_id = 'xBH98O1UTiWRn5np'
client_secret = 'e5hjNXZEJ294afD7N1ArM5y1tv7jogK0fxbNR0jWlgY='

# Create an instance of TidalOAuthClient
oauth_client = Tidal::Client.new(client_id, client_secret)

# Obtain the access token
access_token = oauth_client.get_access_token

puts "Access Token: #{access_token}"
