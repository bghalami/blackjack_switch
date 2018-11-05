class DeckService

  def get_new_deck
    JSON.parse(raw_deck.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://deckofcardsapi.com") do |faraday|
      faraday.use FaradayMiddleware::FollowRedirects
      faraday.adapter Faraday.default_adapter
    end
  end

  def raw_deck
    conn.get("/api/deck/new")
  end
end
