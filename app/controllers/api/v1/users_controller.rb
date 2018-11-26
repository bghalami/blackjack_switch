class Api::V1::UsersController < ApiController
  def create
    user = User.new(user_params)
    user.assign_api_key
    if user.save
      user_saved
    else
      user_not_saved
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def user_saved
    render json: { notice: "User Successfully Create.", status: 202 }, status: 202
  end

  def user_not_saved
    render json: { error: "Something went wrong! Make sure you include username and password.", status: 404 }, status: 404
  end
end
