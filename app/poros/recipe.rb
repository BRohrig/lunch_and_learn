class Recipe
  attr_accessor :title,
                :image,
                :url,
                :country

  def initialize(recipe_data, country)
    @title = recipe_data[:recipe][:label]
    @image = recipe_data[:recipe][:image]
    @url = recipe_data[:recipe][:url]
    @country = country
  end



end