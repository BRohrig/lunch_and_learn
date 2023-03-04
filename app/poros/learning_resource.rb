class LearningResource
  attr_reader :country,
              :video,
              :images,
              :id

  def initialize(country)
    @id = "null"
    @country = country
    @video = YouTubeFacade.find_video(country)
    @images = UnsplashFacade.get_ten_photos(country)
  end


end