class Api::V1::MovesController < ApiController
  before_action :validate_user
  before_action :validate_game

  def create
    action
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
    @user = User.find_by(api_key: params[:api_key])
  end

  def valid_game?
    @game = Game.find_by_id(params[:game_id])
  end

  def action
    if params[:move].upcase == "SWITCH"
      if @game.current_hand.swapped == false
        @game.current_hand.switch
        @game.save
        render json: @game.current_hand
      else
        render json: @game, notice: "Cards have already been switched"
      end
    elsif params[:move].upcase == "HIT"
    elsif params[:move].upcase == "STAY"
    else
      render json: { error: "Please make a valid move."}
    end
  end
end
