SpotifyTest::Application.routes.draw do
  root "spotify#index"

  resources :spotify
  namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    resources :spotify
  end
end
