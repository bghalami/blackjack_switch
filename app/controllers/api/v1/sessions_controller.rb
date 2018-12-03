class Api::V1::SessionsController < ApiController
  def create
    user = User.find_by_username(user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      session_saved(user)
    else
      session_not_saved
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def session_saved(user)
    render json: { notice: "User Successfully Logged In.", status: 202, api_key: user.api_key }, status: 202
  end

  def session_not_saved
    render json: { error: "Something went wrong! Make sure you include the correct username and password.", status: 404 }, status: 404
  end
end
