class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  validates_presence_of :hands_played, :win_loss, :deck_id
end
