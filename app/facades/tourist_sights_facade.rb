class TouristSightsFacade
  def self.find_sights(country)
    long_lat = CountriesFacade.get_capital_long_lat(country)
    sights = PlacesService.get_tourist_sights(long_lat)
    sights[:features].map do |sight_data|
      TouristSight.new(sight_data)
    end
  end
end