# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'unsplash photo library API service' do
  it 'can return a list of photos and their URLs when given a search parameter', :vcr do
    response = UnsplashService.get_photos('England')

    expect(response).to have_key(:results)
    expect(response[:results]).to be_an(Array)
    expect(response[:results][0]).to have_key(:urls)
    expect(response[:results][0]).to have_key(:alt_description)
  end
end
