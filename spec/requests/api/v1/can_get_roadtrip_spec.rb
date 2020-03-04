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

      expect(response).to be_successful
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes][:origin]).to_not be_empty
      expect(result[:data][:attributes][:destination]).to_not be_empty
      expect(result[:data][:attributes][:travel_time]).to_not be_empty
      expect(result[:data][:attributes][:arrival_forecast]).to_not be_empty
    end 

    it "can get an error code and message if post params are incorrect" do
      user = User.create!(
                email: "new@example.com",
                password: "password",
                password_confirmation: "password"
                )

      params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": 1324876089761324
                }

      post '/api/v1/road_trip', params: params

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(401)
      expect(result[:error]).to_not be_empty
    end
  end 
end 