require "rails_helper"

describe "User sends info to api for login" do
  before(:each) do
    User.create(username: "ben_10", password: "wiggles", api_key: "abc123")
  end
  it "should create a new session" do
    post "/api/v1/users", params: { username: "ben_10", password: "wiggles"}
    post "/api/v1/login", params: { username: "ben_10", password: "wiggles"}

    expect(response).to be_successful

    expect(response.body).to eq("{\"notice\":\"User Successfully Logged In.\",\"status\":202}")
  end
  it "should deny a user login if there's no username" do
    params = { password: "wiggles"}
    post "/api/v1/login", params: params
    expect(response).to_not be_successful
  end
  it "should deny a user login if there's no password" do
    params = { username: "wiggles"}
    post "/api/v1/login", params: params
    expect(response).to_not be_successful
  end
  it "should deny a user login if password is wrong" do
    params = { username: "wiggles", password: "wig"}
    post "/api/v1/login", params: params
    expect(response).to_not be_successful
  end
end
