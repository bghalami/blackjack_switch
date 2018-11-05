class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {
        error: "User Successfully Create.",
        status: 202
        }, status: 202
    else
      render json: {
        error: "Something went wrong! Try again.",
        status: 404
        }, status: 404
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
