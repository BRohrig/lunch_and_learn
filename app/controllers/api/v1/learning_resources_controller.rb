# frozen_string_literal: true

module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        render json: LearningResourceSerializer.new(LearningResourceFacade.make_resource(params[:country]))
      end
    end
  end
end
