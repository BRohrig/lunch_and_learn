class Api::V1::RecipesController < ApplicationController
  def index
    if params[:query]
      render json: RecipeSerializer.new(RecipesFacade.get_recipes_by_country(params[:query]))
    elsif params[:query].nil?
      render json: RecipeSerializer.new(RecipesFacade.get_recipes_by_country(CountriesFacade.country_names.sample))
    end
  end
end
