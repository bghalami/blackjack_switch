require "rails_helper"

describe "User sends info to see a game" do
  it "should show json for game" do
    user = User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
    post "/api/v1/games", params: { user_id: user.id, api_key: user.api_key}
    game = Game.last

    get "/api/v1/games/#{game.id}", params: {api_key: "abc123"}

    expect(response).to be_successful

    expect = { game_id: 1, players: [ { username: "ben_10", chip_count: 10000 } ] }
    actual = JSON.parse(response.body, symbolize_names: true)

    expect(actual).to eq(expect)
  end
end
