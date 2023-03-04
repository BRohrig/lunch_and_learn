class Api::V1::LearningResourcesController < ApplicationController
  def index
    
    render json: LearningResourceSerializer.new(LearningResourceFacade.make_resource(params[:country]))
  end 

end