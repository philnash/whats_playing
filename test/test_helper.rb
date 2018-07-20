ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:spotify, {
  :id => 'test',
  :credentials => {
    :token => 'test-token',
    :refresh_token => 'test-refresh-token'
  }
})