# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'countries facade', :vcr do
  it 'can create an array of the names of all countries' do
    countries_list = CountriesFacade.country_names
    expect(countries_list).to be_an(Array)
    expect(countries_list.count).to eq(250)
    expect(countries_list).to include('United Kingdom')
    expect(countries_list).to include('Zambia')
    expect(countries_list).to include('New Zealand')
  end

  it 'has a method to validate country existence', :vcr do
    expect(CountriesFacade.validate_country("Canada")).to eq(true)
    expect(CountriesFacade.validate_country("Muffintown")).to eq(false)
  end

  it 'has a method to get the longitude and latitude for a countrys capital city', :vcr do
    expect(CountriesFacade.get_capital_long_lat("Peru")).to eq("-77.05,-12.05")
    expect(CountriesFacade.get_capital_long_lat("Japan")).to eq("139.75,35.68")
  end
end
