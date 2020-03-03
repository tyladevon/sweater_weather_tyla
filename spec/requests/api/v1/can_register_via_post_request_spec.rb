require 'rails_helper'

describe "users endpoint" do
  it "can register with email and password", :vcr do
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: params

    expect(response).to be_successful

    JSON.parse(response.body, symbolize_names: true)
  end

  it "cannot register if email or password are missing", :vcr do
     params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "wrong password"
    }

    post '/api/v1/users', params: params

    expect(response.status).to eq(400)
    expect(flash[:error]).to eq("")
  end
end