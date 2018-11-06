require 'rails_helper'

describe 'User wants to play a hand' do
  describe 'User wants to switch top two cards' do
    it "should flip the top two cards" do
      user = User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
      post "/api/v1/games", params: { user_id: user.id, api_key: user.api_key}
      game = Game.last

      params = { api_key: user.api_key, bet: 100}
      post "/api/v1/games/#{game.id}/deal", params: params

      deal_response = JSON.parse(response.body, symbolize_names: true)
      hands = [deal_response[:players].first[:hand_one], deal_response[:players].first[:hand_two]].flatten

      post "/api/v1/games/#{game.id}/current_hand/moves", params: { move: "switch", api_key: user.api_key }

      expect(response).to be_successful

      switch_response = JSON.parse(response.body, symbolize_names: true)
      actual = [switch_response[:players].first[:hand_one], switch_response[:players].first[:hand_two]].flatten
      expectation = [hands[0], hands[3], hands[2], hands[1]]
      expect(actual).to eq(expectation)
    end
  end
end
