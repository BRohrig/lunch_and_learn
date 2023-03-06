require 'rails_helper'

RSpec.describe "places api service" do
  it 'can return tourist sights based on a given latitude and longitude', :vcr do
    tourist_sights = PlacesService.get_tourist_sights("-77.05,-12.05")

    expect(tourist_sights).to be_a(Hash)
    expect(tourist_sights[:type]).to eq("FeatureCollection")
    expect(tourist_sights[:features][0][:properties][:name]).to eq("Complejo Arqueológico Mateo Salado")
  end



end