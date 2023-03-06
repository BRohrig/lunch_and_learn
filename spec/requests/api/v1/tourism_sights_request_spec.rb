require 'rails_helper'

RSpec.describe "capital city tourism sights endpoint" do
  it 'returns a list of all tourist sights within 20k of the capital city of a requested country', :vcr do
    get api_v1_tourist_sights_path, params: { country: "Canada" }

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_an(Array)
    parsed[:data].each do |tourist_sight|
      expect(tourist_sight[:id]).to eq("null")
      expect(tourist_sight[:type]).to eq("tourist_sight")
      expect(tourist_sight).to have_key(:attributes)
      expect(tourist_sight[:attributes]).to have_key(:name)
      expect(tourist_sight[:attributes]).to have_key(:address)
      expect(tourist_sight[:attributes]).to have_key(:place_id)
    end
  end



end