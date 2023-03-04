class RecipesFacade
  def self.get_recipes_by_country(country)
    RecipesService.get_recipes_by_country(country)[:hits].map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end
end
