SpotifyTest::Application.routes.draw do
  root "spotify#index"

  resources :spotify
  namespace :v1 do
    resources :spotify, defaults: {format: :json} do
      collection do
        post :set_favorite
        get :favorites
      end
    end
  end
end
