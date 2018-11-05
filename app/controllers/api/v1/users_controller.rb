class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user_saved
    else
      user_not_saved
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def user_saved
    render json: {
      error: "User Successfully Create.",
      status: 202
      }, status: 202
  end

  def user_not_saved
    render json: { error: "Something went wrong! Try again.", status: 404 }, status: 404
  end
end
