# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        if params[:country] && CountriesFacade.validate_country(params[:country])
          render json: RecipeSerializer.new(RecipesFacade.get_recipes_by_country(params[:country]))
        elsif params[:country].nil?
          render json: RecipeSerializer.new(RecipesFacade.get_recipes_by_country(CountriesFacade.country_names.sample))
        else
          render json: {"data": []}
        end
      end
    end
  end
end
