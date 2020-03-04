require 'rails_helper'

describe "client can visit sessions endpoint" do 
  describe "can pass email and password through params" do 
    it "can get a 200 ok response with api key" do
      User.create!(
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
        )
      params = {
                "email": "whatever@example.com",
                "password": "password"
                }
      post '/api/v1/sessions', params: params

      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes][:api_key]).to_not be_empty
    end
    it "gets an error code and message if password is incorrect" do
      User.create!(
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
        )
      params = {
                "email": "whatever@example.com",
                "password": "wrong password"
                }
      post '/api/v1/sessions', params: params

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
      expect(result[:error]).to_not be_empty
    end

    it "gets an error code and message if email is empty" do
      User.create!(
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
        )
      params = {
                "email": "",
                "password": "password"
                }
      post '/api/v1/sessions', params: params

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
      expect(result[:error]).to_not be_empty
    end
  end
end