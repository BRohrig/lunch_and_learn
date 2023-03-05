# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'photo poro' do
  it 'exists and has accessible attributes' do
    photo = Photo.new({ urls: { raw: 'http://www.testphoto.com' },
                        alt_description: 'This is a pretty photo' })

    expect(photo).to be_a(Photo)
    expect(photo.url).to eq('http://www.testphoto.com')
    expect(photo.alt_tag).to eq('This is a pretty photo')
  end
end
