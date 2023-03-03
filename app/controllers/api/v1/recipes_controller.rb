class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.new(RecipesFacade.get_recipes_by_country(params[:query]))
  end
end