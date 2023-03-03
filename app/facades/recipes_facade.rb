class RecipesFacade
  def self.get_recipes_by_country(country)
    RecipesService.get_recipes_by_country(country)
  end

end