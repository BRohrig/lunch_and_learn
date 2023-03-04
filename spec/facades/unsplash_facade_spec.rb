require 'rails_helper'

RSpec.describe 'unsplash facade' do
  it 'can find 10 photos related to a country', :vcr do
    photo_list = UnsplashFacade.get_ten_photos("Peru")

    expect(photo_list).to be_an(Array)
    expect(photo_list.count).to eq(10)
    
    photo_list.each do |photo_item|
      expect(photo_item).to be_a(Photo)
      expect(photo_item.url).to be_a(String)
      expect(photo_item.url[0..26]).to eq("https://images.unsplash.com")
      expect(photo_item.alt_tag).to be_a(String)
    end
  end


end