require 'rails_helper'

describe "users endpoint" do
  it "can register with email and password" do
    params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: params

    expect(response).to be_successful

    status = JSON.parse(response.body, symbolize_names: true)
  end
end