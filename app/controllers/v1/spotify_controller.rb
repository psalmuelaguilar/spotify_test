class V1::SpotifyController < ApplicationController
  def index
      # FETCH SERVICE
    service = SpotifyServices::Search.new({query: params[:spotify_search]})
    response = service.fetch

    respond_to do |format|
      format.json { render json: service.process.to_json }
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
