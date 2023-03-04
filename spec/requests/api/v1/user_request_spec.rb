require 'rails_helper'

RSpec.describe 'user creation endpoint' do
  it 'can receive a JSON body with name and email, and create a user with a unique API key' do
    headers = "Content-Type: application/json"
    body = {"name": "I am a nice user",
            "email": "notahacker@niceperson.com"}

    post ap1_v1_users_path, headers: headers, body: body

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    user = User.last
    expect(parsed).to have_key(:data)
    expect(parsed[:data][:type]).to eq("user")
    expect(parsed[:data][:id]).to eq(user.id)
    expect(parsed[:data][:attributes]).to eq({name: "I am a nice user",
                                              email: "notahacker@niceperson.com",
                                              api_key: user.api_key})


  end


end