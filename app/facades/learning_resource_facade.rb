# frozen_string_literal: true

class LearningResourceFacade
  def self.make_resource(country)
    if CountriesFacade.validate_country(country)
      images = UnsplashFacade.get_ten_photos(country)
      video = YouTubeFacade.find_video(country)
    else
      images = []
      video = {}
    end
    LearningResource.new(country, images, video)
  end
end
