class Api::V1::GamesController < ApiController
  before_action :validate_user

  def create
    game = Game.new
    game.get_deck_id
    if game.save
      new_game_save(game)
    else
      render json: { error: "Something went wrong, try again" }, status: 401
    end
  end

  private

  def validate_user
    unless valid_user?
      render json: { error: "Unauthorized User" }, status: 401
    end
  end

  def valid_user?
    User.find_by(api_key: params[:api_key])
  end

  def new_game_save(new_game)
    user = User.find_by_id(params[:user_id])
    user.games << new_game
    render json: new_game
  end
end
