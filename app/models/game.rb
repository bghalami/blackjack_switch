class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  serialize :current_hand

  validates_presence_of :hands_played, :win_loss, :deck_id


  def get_deck_id(number_of_decks)
    self.deck_id = service.get_new_deck(number_of_decks)[:deck_id]
  end

  private

  def service
    DeckService.new
  end
end
