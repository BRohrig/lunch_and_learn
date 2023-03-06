# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'learning resource facade' do
  it 'can create a learning resource object when passed a country', :vcr do
    resource = LearningResourceFacade.make_resource('China')

    expect(resource).to be_a(LearningResource)
    expect(resource.id).to eq('null')
    expect(resource.country).to eq('China')
    expect(resource.video).to be_a(Video)
    expect(resource.images).to be_an(Array)
    resource.images.each do |photo|
      expect(photo).to be_a(Photo)
    end
  end

  it 'returns empty structures for images and video if country validation fails', :vcr do
    not_a_country = LearningResourceFacade.make_resource('muffinville')
    expect(not_a_country.images).to eq([])
    expect(not_a_country.video).to eq({})
  end
end
