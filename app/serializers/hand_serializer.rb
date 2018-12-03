class HandSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :game_id, :players, :dealer_hand, :one_stay, :two_stay, :winner

  def game_id
    object.game_id
  end

  def players
    get_game.users.map do |user|
      { username:   user.username,
        chip_count: user.chip_count,
        hand_one:   object.hand_one.map { |card| card[:code] },
        hand_two:   object.hand_two.map { |card| card[:code] },
        bet:        object.bet
      }
    end
  end

  def dealer_hand
    object.dealer_hand.map { |card| card[:code] }
  end

  def get_game
    Game.find(game_id)
  end

  def winner
    object.winner
  end

  def one_stay
    object.one_stay
  end

  def two_stay
    object.two_stay
  end
end
