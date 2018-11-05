require "rails_helper"

describe "User sends info to api" do
  it "should create a new user" do
    post "/api/v1/users", params: { username: "ben_10", password: "wiggles"}

    expect(response).to be_successful

    user = User.last

    expect(user.username).to eq("ben_10")
  end
end
