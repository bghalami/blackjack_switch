require "rails_helper"

describe "User sends info to create a game" do
  it "should create a new game" do
    user = User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
    post "/api/v1/games", params: { user_id: user.id, api_key: user.api_key}

    expect(response).to be_successful

    expect = { game_id: 1, players: [ { username: "ben_10", chip_count: 10000 } ] }
    actual = JSON.parse(response.body, symbolize_names: true)
    expect(actual).to eq(expect)
  end
  it "should not create a new game if api key is invalid" do
    user = User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
    post "/api/v1/games", params: { user_id: user.id, api_key: "123abc"}

    expect(response).to_not be_successful
  end
end
