require 'rails_helper'

RSpec.describe 'tourism sights facade' do
  it 'can get all tourist sights for a specified countrys capital and return them as tourism sight poros', :vcr do
    tourism_sights = TouristSightsFacade.find_sights("Peru")

    expect(tourism_sights).to be_an(Array)
    expect(tourism_sights.count).to eq(20)
    tourism_sights.each do |sight|
      expect(sight).to be_a(TouristSight)
      expect(sight.id).to eq("null")
    end


  end


end