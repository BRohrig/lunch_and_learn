class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    new_user.create_api_key
    new_user.save
    # render json: UserSerializer.new(new_user)
    render json: UserSerializer.new(new_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end