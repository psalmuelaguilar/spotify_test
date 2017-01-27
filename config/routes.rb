SpotifyTest::Application.routes.draw do
  root "spotify#index"

  resources :spotify
  namespace :v1 do
    resources :spotify
  end
end
