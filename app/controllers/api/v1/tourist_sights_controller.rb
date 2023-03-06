class Api::V1::TouristSightsController < ApplicationController
  def index
    render json: TouristSightSerializer.new(TouristSightsFacade.find_sights(params[:country]))
  end

end