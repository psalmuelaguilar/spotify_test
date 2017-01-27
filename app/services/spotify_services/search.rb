module SpotifyServices
  class Search < SpotifyBase
    def initialize(object)
      @query = object[:query]
      @type = "artist"
    end


    def fetch
      @response ||= HTTParty.get(full_url, query: {q: @query, type: @type})
    end

    def process
      response = []
      JSON.parse(@response.body)["artists"]["items"].each do |resp|
        response << {
          id: resp['id'],
          external_urls: resp['external_urls']['spotify'],
          genres: resp['genres'],
          href: resp['href'],
          href: resp['name'],
        }
      end

      response
    end
  end
end
