class Api::V1::RecipesController < ApplicationController
  def index
    binding.pry
    render json: RecipesFacade.get_recipes_by_country(params[:query])
  end
end