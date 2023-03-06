# frozen_string_literal: true

class CountriesFacade
  def self.country_names
    CountriesService.get_countries.flat_map do |country|
      country[:name][:common]
    end
  end

  def self.get_capital_long_lat(country)
    CountriesService.get_capital_lat_long(country).reverse.join(" ").gsub(" ", ",")
  end

  def self.validate_country(country)
    country_names.include?(country)
  end
end
