# frozen_string_literal: true

class LearningResourceFacade
  def self.make_resource(country)
    if validate_country(country)
      images = UnsplashFacade.get_ten_photos(country)
      video = YouTubeFacade.find_video(country)
    else
      images = []
      video = {}
    end
    LearningResource.new(country, images, video)
  end

  def self.validate_country(country)
    CountriesFacade.country_names.include?(country)
  end
end
