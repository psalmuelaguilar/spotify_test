class SpotifyController < ApplicationController
  def index
    if params[:spotify_search].present?
      # FETCH SERVICE
      service = SpotifyServices::Search.new({query: params[:spotify_search]})
      response = service.fetch
      service.process
    end
  end
end
