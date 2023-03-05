# frozen_string_literal: true

class LearningResource
  attr_reader :country,
              :video,
              :images,
              :id

  def initialize(country, images, video)
    @id = 'null'
    @country = country
    @video =  video
    @images = images
  end
end
