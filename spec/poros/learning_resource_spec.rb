# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'learning resource poro' do
  it 'exists and has accessible attributes' do
    resource = LearningResource.new('Flavortown', %w[pic1 pic2 pic3], { video: 'pretty video' })
    expect(resource).to be_a(LearningResource)
    expect(resource.id).to eq('null')
    expect(resource.country).to eq('Flavortown')
    expect(resource.images).to eq(%w[pic1 pic2 pic3])
    expect(resource.video).to eq({ video: 'pretty video' })
  end
end
