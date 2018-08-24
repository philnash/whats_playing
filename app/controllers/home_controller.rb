class HomeController < ApplicationController
  def index
    @playlist_id = ENV.fetch('SPOTIFY_PLAYLIST_ID', nil)
    @user_id = ENV.fetch('SPOTIFY_USER_ID', nil)
  end

  def callback
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @new_playlist = @spotify_user.create_playlist!('WhatsPlaying')
    render :callback
  end
end
