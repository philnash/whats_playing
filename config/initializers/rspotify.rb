begin
  require 'rspotify/oauth'

  RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"], scope: 'playlist-modify-public'
  end
rescue RestClient::BadRequest => e
  puts "=======\n" \
       "Missing Spotify client credentials. Please enter SPOTIFY_CLIENT_ID\n" \
       "and SPOTIFY_CLIENT_SECRET in config/env.yml.\n" \
       "======="
end