class Hand
  attr_reader :user,
              :game_id,
              :bet,
              :hand_one,
              :hand_two,
              :dealer_hand,
              :swapped,
              :winner,
              :message

  def initialize(user, game, bet)
    @user        = user
    @game_id     = game.id
    @bet         = bet.to_i
    @hand_one    = []
    @one_stay    = false
    @hand_two    = []
    @two_stay    = false
    @dealer_hand = []
    @swapped     = false
    @winner      = ""
    @message     = ""
    shuffle_up_and_deal
  end

  def switch
    @hand_one[1], @hand_two[1] = @hand_two[1], @hand_one[1]
    @swapped = true
  end

  def hit
    check_hands
    if @one_stay == false
      @hand_one << draw_a_card[:cards].first
      check_hands
    elsif @one_stay == true && @two_stay == false
      @hand_two << draw_a_card[:cards].first
      check_hands
    end
  end

  def stay
    if @one_stay == false
      @one_stay = true
      check_hands
    elsif @one_stay == true && @two_stay == false
      @two_stay = true
      check_hands
    end
  end

  def check_hands
    check_hand_one
    check_hand_two
    if @one_stay == true && @two_stay == true
      if hand_one_sum > 21 && hand_two_sum > 21
        @winner = "dealer"
      else
        dealer_play
      end
    end
  end

  private

  def dealer_play
    dealer_draw
    if dealer_sum > 21
      @winner = "player"
    elsif (hand_one_sum > dealer_sum && (hand_two_sum < dealer_sum || hand_two_sum > 21)) || (hand_two_sum > dealer_sum && (hand_one_sum < dealer_sum || hand_one_sum > 21))
      @winner = "draw"
    elsif hand_one_sum <= 21 && hand_two_sum <= 21 && hand_one_sum > dealer_sum && hand_two_sum > dealer_sum
      @winner = "player"
    elsif dealer_sum <= 21 && hand_one_sum < dealer_sum && hand_two_sum < dealer_sum
      @winner = "dealer"
    end
  end

  def dealer_draw
    if hand_one_sum <= 21
      while dealer_sum < hand_one_sum
        @dealer_hand << draw_a_card[:cards].first
        if dealer_sum > 21
          return
        end
      end
    end
    if hand_two_sum <= 21
      while dealer_sum < hand_two_sum
        @dealer_hand << draw_a_card[:cards].first
        if dealer_sum > 21
          return
        end
      end
    end
  end

  def check_hand_one
    if hand_one_sum > 21
      @one_stay = true
    end
  end

  def check_hand_two
    if hand_two_sum > 21
      @two_stay = true
    end
  end

  def hand_one_sum
    @hand_one.sum { |card| card_hash[card[:code]] }
  end

  def hand_two_sum
    @hand_two.sum { |card| card_hash[card[:code]] }
  end

  def dealer_sum
    @dealer_hand.sum { |card| card_hash[card[:code]] }
  end

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

  def card_hash
    { "2S" => 2,
      "3S" => 3,
      "4S" => 4,
      "5S" => 5,
      "6S" => 6,
      "7S" => 7,
      "8S" => 8,
      "9S" => 9,
      "0S" => 10,
      "JS" => 10,
      "QS" => 10,
      "KS" => 10,
      "AS" => 11,
      "2C" => 2,
      "3C" => 3,
      "4C" => 4,
      "5C" => 5,
      "6C" => 6,
      "7C" => 7,
      "8C" => 8,
      "9C" => 9,
      "0C" => 10,
      "JC" => 10,
      "QC" => 10,
      "KC" => 10,
      "AC" => 11,
      "2D" => 2,
      "3D" => 3,
      "4D" => 4,
      "5D" => 5,
      "6D" => 6,
      "7D" => 7,
      "8D" => 8,
      "9D" => 9,
      "0D" => 10,
      "JD" => 10,
      "QD" => 10,
      "KD" => 10,
      "AD" => 11,
      "2H" => 2,
      "3H" => 3,
      "4H" => 4,
      "5H" => 5,
      "6H" => 6,
      "7H" => 7,
      "8H" => 8,
      "9H" => 9,
      "0H" => 10,
      "JH" => 10,
      "QH" => 10,
      "KH" => 10,
      "AH" => 11
    }
  end
end
