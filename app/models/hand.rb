class Hand
  attr_reader :user,
              :game_id,
              :bet,
              :hand_one,
              :hand_two,
              :dealer_hand,
              :swapped

  def initialize(user, game, bet)
    @user        = user
    @game_id     = game.id
    @bet         = bet.to_i
    @hand_one    = []
    @hand_two    = []
    @dealer_hand = []
    @swapped     = false
    shuffle_up_and_deal
  end

  def switch
    @hand_one[1], @hand_two[1] = @hand_two[1], @hand_one[1]
    @swapped = true
  end

  private

  def shuffle_up_and_deal
    take_bet
    while @dealer_hand.count < 2
      @hand_one    << draw_a_card[:cards].first
      @hand_two    << draw_a_card[:cards].first
      @dealer_hand << draw_a_card[:cards].first
    end
  end

  def get_game
    Game.find(@game_id)
  end

  def take_bet
    new_count = @user.chip_count - @bet
    @user.update(chip_count: new_count)
  end

  def draw_a_card
    service.draw_card_parse(get_game.deck_id)
  end

  def service
    DeckService.new
  end
end
