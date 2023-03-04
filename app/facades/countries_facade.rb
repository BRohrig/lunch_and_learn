class CountriesFacade
  def self.country_names
    CountriesService.get_countries.flat_map do |country|
      country[:name][:common]
    end
  end
end
