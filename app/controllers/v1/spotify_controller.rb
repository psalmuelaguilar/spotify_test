class V1::SpotifyController < ApplicationController
  def index
    if params[:spotify_search].present?
      # FETCH SERVICE
      service = SpotifyServices::Search.new({query: params[:spotify_search]})
      response = service.fetch
      render json: service.process.to_json
    end
  end

  def set_favorite
    service = SpotifyServices::Search.new({id: '04gDigrS5kc9YWfZHwBETP'})
    if favorite = Favorite.create(request_params)
      render json: favorite
    end
  end

  def request_params
    @request_params ||= params.permit(:spotify_id, :external_urls, :genres, :href, :name)
  end
end
