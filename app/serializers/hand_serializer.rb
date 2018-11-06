class HandSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :game_id, :players, :dealer_hand

  def game_id
    object.game_id
  end

  def players
    get_game.users.map do |user|
      { username:   user.username,
        chip_count: user.chip_count,
        hand_one:   [object.hand_one[0][:code], object.hand_one[1][:code]],
        hand_two:   [object.hand_two[0][:code], object.hand_two[1][:code]],
        bet:        object.bet
      }
    end
  end

  def dealer_hand
    [object.dealer_hand[0][:code], object.dealer_hand[1][:code]]
  end

  def get_game
    Game.find(game_id)
  end
end
