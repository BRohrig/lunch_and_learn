class LearningResourceFacade
  def self.make_resource(country)
    LearningResource.new(country)
  end
end
