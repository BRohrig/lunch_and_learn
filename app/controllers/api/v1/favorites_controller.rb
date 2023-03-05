# frozen_string_literal: true

module Api
  module V1
    class FavoritesController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])
        if user
          user.favorites.create(favorite_params)
          render json: { "success": 'Favorite added successfully' }, status: 201
        else
          invalid_api_key
        end
      end

      def index
        user = User.find_by(api_key: params[:api_key])
        if user
          render json: FavoriteSerializer.new(user.favorites)
        else
          invalid_api_key
        end
      end

      private

      def favorite_params
        params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
      end
    end
  end
end
