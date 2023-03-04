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
end
