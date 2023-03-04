class LearningResource
  attr_reader :country,
              :video,
              :images,
              :id

  def initialize(country)
    @id = 'null'
    @country = country
    @video =  if validate_country(country)
                YouTubeFacade.find_video(country)
              else
                {}
              end
    @images = if validate_country(country)
                UnsplashFacade.get_ten_photos(country)
              else
                []
              end
  end

  private

  def validate_country(country)
    CountriesFacade.country_names.include?(country)
  end
end
