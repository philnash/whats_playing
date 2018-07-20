require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get callback" do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    mock_spotify_user = Minitest::Mock.new
    mock_playlist = Minitest::Mock.new
    mock_playlist.expect :id, 'id'
    mock_spotify_user.expect :create_playlist!, mock_playlist, ['WhatsPlaying']
    mock_spotify_user.expect :id, 'id'
    credentials = { 'token' => 'spotify-token', 'refresh_token' => 'spotify-refresh-token' }
    mock_spotify_user.expect :credentials, credentials
    mock_spotify_user.expect :credentials, credentials
    RSpotify::User.stub :new, mock_spotify_user do
      get auth_spotify_callback_url
      assert_response :success
      assert_mock mock_spotify_user
    end
  end

end
