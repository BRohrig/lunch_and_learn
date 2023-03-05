# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'youtube facade' do
  it 'can call the youtube service and create a video object for a country', :vcr do
    video = YouTubeFacade.find_video('Iran')
    expect(video).to be_a(Video)
    expect(video.title).to eq('A Super Quick History of Iran')
    expect(video.youtube_video_id).to eq('0sTf1FIxnJs')
  end
end
