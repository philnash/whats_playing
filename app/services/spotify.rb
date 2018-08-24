class Spotify
  def initialize(user_id, user_token, user_refresh_token)
    @user = RSpotify::User.new({
      'id' => user_id,
      'credentials' => {
        'token' => user_token,
        'refresh_token' => user_refresh_token
      }
    })
  end

  def track_search(query)
    RSpotify::Track.search(query).first
  end

  def add_to_playlist(playlist_id, track_id)
    playlist = RSpotify::Playlist.find(@user.id, playlist_id)
    playlist.add_tracks!([track_id])
  end
end
