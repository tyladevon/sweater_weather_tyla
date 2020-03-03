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

  it "cannot register if passwords are mismatched", :vcr do
     params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "wrong password"
    }

    post '/api/v1/users', params: params

    expect(response.status).to eq(400)
    expect(response.body).to_not be_empty
  end

  it "cannot register if email is missing" do
     params = {
      "email": "",
      "password": "password",
      "password_confirmation": "password"
      }

    post '/api/v1/users', params: params

    expect(response.status).to eq(400)
    expect(response.body).to_not be_empty
  end
end