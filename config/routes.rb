SpotifyTest::Application.routes.draw do
  root "spotify#index"

  resources :spotify
end
