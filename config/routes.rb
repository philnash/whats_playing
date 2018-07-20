Rails.application.routes.draw do
  root 'home#index'
  get '/auth/spotify/callback', to: 'home#callback'
end
