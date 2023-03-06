# frozen_string_literal: true

class CountriesService
  def self.get_countries
    response = conn.get('all')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_capital_lat_long(country)
    response = conn.get("name/#{country}?fullText=true")
    JSON.parse(response.body, symbolize_names: true)[0][:capitalInfo][:latlng]
  end

  private

  def self.conn
    Faraday.new(url: 'https://restcountries.com/v3.1/')
  end
end
