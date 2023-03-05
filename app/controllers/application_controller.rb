# frozen_string_literal: true

class ApplicationController < ActionController::API
  def invalid_api_key
    render json: { errors: 'Invalid API key' }, status: 403
  end
end
