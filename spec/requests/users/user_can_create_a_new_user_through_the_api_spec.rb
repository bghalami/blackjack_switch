require "rails_helper"

describe "User sends info to api" do
  it "should create a new user" do
    post "/api/v1/users", params: { username: "ben_10", password: "wiggles"}
    expect(response).to be_successful
    user = User.last
    expect(user.username).to eq("ben_10")
  end
  it "should deny a user create if there's no username" do
    params = { password: "wiggles"}
    post "/api/v1/users", params: params
    expect(response).to_not be_successful
  end
  it "should deny a user create if there's no password" do
    params = { username: "wiggles"}
    post "/api/v1/users", params: params
    expect(response).to_not be_successful
  end
end
