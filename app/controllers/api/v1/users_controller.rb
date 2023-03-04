class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    new_user.create_api_key
    if new_user.save
      render json: UserSerializer.new(new_user)
    else
      render json: ErrorSerializer.serialize(Error.new(new_user.errors))
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end