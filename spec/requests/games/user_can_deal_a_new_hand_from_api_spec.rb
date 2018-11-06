require 'rails_helper'

describe 'User wants to deal a hand' do
  it "should return JSON of one blackjackswitch hand" do
    user = User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
    post "/api/v1/games", params: { user_id: user.id, api_key: user.api_key}
    game = Game.last

    params = { api_key: user.api_key, bet: 100}

    post "/api/v1/games/#{game.id}/deal", params: params

    expect(response).to be_successful

    actual = JSON.parse(response.body, symbolize_names: true)

    expect(actual[:game_id]).to be_a(Integer)
    expect(actual[:players]).to be_a(Array)
    expect(actual[:players].first[:username]).to be_a(String)
    expect(actual[:players].first[:chip_count]).to be_a(Integer)
    expect(actual[:players].first[:hand_one]).to be_a(Array)
    expect(actual[:players].first[:hand_two]).to be_a(Array)
    expect(actual[:players].first[:hand_one][0]).to be_a(String)
    expect(actual[:players].first[:hand_one][1]).to be_a(String)
    expect(actual[:players].first[:hand_two][0]).to be_a(String)
    expect(actual[:players].first[:hand_two][1]).to be_a(String)
    expect(actual[:players].first[:bet]).to be_a(Integer)
    expect(actual[:dealer_hand]).to be_a(Array)
    expect(actual[:dealer_hand][0]).to be_a(String)
    expect(actual[:dealer_hand][1]).to be_a(String)
  end
end
