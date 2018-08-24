Rails.application.routes.draw do
  root 'home#index'
  get '/auth/spotify/callback', to: 'home#callback'

  namespace :twilio do
    post 'messages', to: 'messages#create'
  end
end
