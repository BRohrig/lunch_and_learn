class UnsplashFacade
  def self.get_ten_photos(country)
    UnsplashService.get_photos(country)[:results].flat_map do |photo_data|
      Photo.new(photo_data)
    end
  end
end
