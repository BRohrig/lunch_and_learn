# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'youtube api service' do
  it 'can make calls to the youtube API and return a video about a country based on a query', :vcr do
    response = YouTubeService.get_video('Qatar')

    expect(response[:items][0][:snippet]).to be_a(Hash)
    expect(response[:items][0][:snippet][:title]).to eq('A Super Quick History of Qatar')
    expect(response[:items][0][:id][:videoId]).to eq('eoqBjQKubrQ')
  end
end
