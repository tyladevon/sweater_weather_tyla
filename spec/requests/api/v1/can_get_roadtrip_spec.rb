require 'rails_helper'

describe "registered client can post to roadtrip endpoint" do
  describe "with origin, destination and api-key" do
    it "can get a response with travel information", :vcr do
      user = User.create!(
                email: "new@example.com",
                password: "password",
                password_confirmation: "password"
                )

      params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "#{user.api_key}"
                }

      post '/api/v1/road_trip', params: params

      # expect(response).to be_successful
      # result = JSON.parse(response.body, symbolize_names: true)
      # expect(result[:data][:attributes][:api_key]).to_not be_empty
    end 
  end 
end 