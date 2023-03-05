# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'video poro' do
  it 'exists and has accessible attributes' do
    video = Video.new({ id: { videoId: '12145151' },
                        snippet: { title: 'This is a video' } })

    expect(video).to be_a(Video)
    expect(video.title).to eq('This is a video')
    expect(video.youtube_video_id).to eq('12145151')
  end
end
