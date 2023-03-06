# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'countries service' do
  it 'can get a list of all countries', :vcr do
    response = CountriesService.get_countries
    expect(response).to be_an(Array)
    expect(response.count).to eq(250)
    response.each do |country|
      expect(country).to have_key(:name)
    end
  end

  it 'can get the lat/long of the capital city of a country', :vcr do
    expect(CountriesService.get_capital_lat_long("Peru")).to eq([-12.05, -77.05])
    expect(CountriesService.get_capital_lat_long("Japan")).to eq([35.68, 139.75])
  end
end
