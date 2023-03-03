require 'rails_helper'

RSpec.describe "recipes requests API V1", :vcr do
  it 'can find recipes for a country' do
    get api_v1_recipes_path, params: {query: "Norway"}

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to be_an(Array)
    parsed_response[:data].each do |recipe|
      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to eq("Norway")
      expect(recipe[:attributes]).to have_key(:image)
    end
  end


end