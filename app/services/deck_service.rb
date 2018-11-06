class DeckService

  def get_new_deck(number_of_decks = 1)
    JSON.parse(raw_deck(number_of_decks).body, symbolize_names: true)
  end

  def draw_card_parse(deck_id)
    JSON.parse(draw_card(deck_id).body, symbolize_names: true)
  end

  def view_deck(deck_id)
    JSON.parse(deck(deck_id).body, symbolize_names: true)
  end



  private

  def conn
    Faraday.new(url: "https://deckofcardsapi.com") do |faraday|
      faraday.use FaradayMiddleware::FollowRedirects
      faraday.adapter Faraday.default_adapter
    end
  end

  def raw_deck(number_of_decks)
    conn.get("/api/deck/new/shuffle/?deck_count=#{number_of_decks}")
  end

  def draw_card(deck_id)
    conn.get("/api/deck/#{deck_id}/draw")
  end

  def deck(deck_id)
    conn.get("/api/deck/#{deck_id}")
  end
end
