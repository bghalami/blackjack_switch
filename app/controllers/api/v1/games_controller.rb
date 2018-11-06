class Api::V1::GamesController < ApiController
  before_action :validate_user

  def create
    user = valid_user?
    game = user.games.new
    game.get_deck_id(6)
    if game.save
      new_game_save(game)
    else
      render json: { error: "Something went wrong, try again" }, status: 401
    end
  end

  def show
    render json: get_game
  end

  private

  def validate_user
    unless valid_user?
      render json: { error: "Unauthorized User" }, status: 401
    end
  end

  def get_game
    Game.find(params[:id])
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
