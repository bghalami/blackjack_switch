class Api::V1::HandsController < ApiController
  before_action :validate_game
  before_action :validate_user


  def create
    @game.current_hand = Hand.new(@user, @game, params[:bet])
    @game.save
    render json: @game.current_hand
  end

  private

  def validate_user
    unless valid_user?
      render json: { error: "Unauthorized User" }, status: 401
    end
  end

  def validate_game
    unless valid_game?
      render json: { error: "Game Doesn't Exist" }, status: 404
    end
  end

  def valid_user?
    @user = @game.users.find_by(api_key: params[:api_key])
  end

  def valid_game?
    @game = Game.find_by_id(params[:game_id])
  end
end
