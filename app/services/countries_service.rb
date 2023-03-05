# frozen_string_literal: true

class CountriesService
  def self.get_countries
    response = conn.get('all')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://restcountries.com/v3.1/')
  end
end
