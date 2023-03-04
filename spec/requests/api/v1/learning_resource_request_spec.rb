require 'rails_helper'

RSpec.describe 'learning resource endpoint' do
  it 'can return information about a country based on search params', :vcr do
    get api_v1_learning_resources_path, params: { country: "Japan" }

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:id)
    expect(parsed[:id]).to eq("null")
    expect(parsed).to have_key(:type)
    expect(parsed[:type]).to eq("learning_resource")
    expect(parsed).to have_key(:attributes)
    expect(parsed[:attributes]).to be_a(Hash)
    expect(parsed[:attributes]).to have_key(:country)
    expect(parsed[:attributes][:country]).to eq("Japan")
    expect(parsed[:attributes]).to have_key(:video)
    expect(parsed[:attributes][:video]).to be_a(Hash)
    expect(parsed[:attributes][:video]).to have_key(:title)
    expect(parsed[:attributes][:video]).to have_key(:youtube_video_id)
    expect(parsed[:attributes]).to have_key(:images)
    expect(parsed[:attributes][:images]).to be_an(Array)
    expect(parsed[:attributes][:images].count).to eq(10)
    parsed[:attributes][:images].each do |image|
      expect(image).to have_key(:url)
      expect(image).to have_key(:alt_tag)
    end
  end

  it 'returns a response even when no videos or images are found for the searched country', :vcr do
    get api_v1_learning_resources_path, params: { country: "DERP" }

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to eq({data: {
                                id: "null",
                                type: "learning_resource",
                                attributes: {
                                            country: "DERP",
                                            video: {},
                                            images: []
                                            }
                                }
                          }
                        )
                     
  end


end