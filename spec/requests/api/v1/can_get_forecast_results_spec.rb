require 'rails_helper'

RSpec.describe "'/forecast/location' endpoint" do
  it 'can get forcast for that location', :vcr do
    get "/api/v1/forecast?location=denver,co"
    
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:data][:attributes][:current]).to_not be_empty
    expect(data[:data][:attributes][:details]).to_not be_empty
    expect(data[:data][:attributes][:forecast]).to_not be_empty
  end
end