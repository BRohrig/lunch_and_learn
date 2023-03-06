class PlacesService

  def self.get_tourist_sights(long_lat)
    response = conn.get("?filter=circle:#{long_lat},5000&categories=tourism.sights")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://api.geoapify.com/v2/places") do |f|
      f.params['apiKey'] = ENV["PLACES_API_KEY"]
    end
  end

end