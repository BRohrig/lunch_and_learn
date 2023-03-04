require 'rails_helper'

RSpec.describe 'favorite recipes endpoint' do
  before(:each) do
    @user = User.create(name: 'William McTest', email: 'muffinman@drury_lane.com', api_key: '1234567890')
  end
  it 'can receive a json body with country, recipe title, recipe link, and user api_key and create a favorite for that user' do
    headers = { "Content-Type": 'application/json' }
    body = {  "api_key": "#{@user.api_key}",
              "country": 'Brazil',
              "recipe_link": 'https://www.deliciousmeat.com/STEAK',
              "recipe_title": 'MEAT IS SO TASTY' }

    post api_v1_favorites_path, params: body.to_json, headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    favorite = Favorite.last
    expect(favorite.user_id).to eq(@user.id)
    expect(favorite.country).to eq('Brazil')
    expect(favorite.recipe_link).to eq('https://www.deliciousmeat.com/STEAK')
    expect(favorite.recipe_title).to eq('MEAT IS SO TASTY')
    expect(parsed).to eq({ "success": 'Favorite added successfully' })
  end

  it 'returns an error for invalid api_key if the correct one is not given' do
    headers = { "Content-Type": 'application/json' }
    body = {  "api_key": 'I AM A HACKER RAWR',
              "country": 'Brazil',
              "recipe_link": 'https://www.deliciousmeat.com/STEAK',
              "recipe_title": 'MEAT IS SO TASTY' }

    post api_v1_favorites_path, params: body.to_json, headers: headers
    expect(response).to_not be_successful
    expect(response.status).to eq(403)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq('Invalid API key')
  end

  it 'can list all the favorites associated with a user' do
    user = create(:user)
    favorite = create(:favorite, user_id: user.id)
    favorite2 = create(:favorite, user_id: user.id)
    favorite3 = create(:favorite, user_id: user.id)
    favorite4 = create(:favorite, user_id: user.id)

    get api_v1_favorites_path, params: {api_key: user.api_key}
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_an(Array)
    expect(parsed[:data].count).to eq(4)
    parsed[:data].each do |favorite|
      expect(favorite).to have_key(:id)
      expect(favorite[:type]).to eq("favorite")
      expect(favorite).to have_key(:attributes)
      expect(favorite[:attributes]).to have_key(:recipe_title)
      expect(favorite[:attributes]).to have_key(:recipe_link)
      expect(favorite[:attributes]).to have_key(:country)
      expect(favorite[:attributes]).to have_key(:created_at)
    end
  end

  it 'displays an appropriate error when attempting to get favorites for a user with an incorrect api key' do
    user = create(:user)
    favorite = create(:favorite, user_id: user.id)

    get api_v1_favorites_path
    
    expect(response).to_not be_successful
    expect(response.status).to eq(403)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:errors]).to eq('Invalid API key')
  end
end
