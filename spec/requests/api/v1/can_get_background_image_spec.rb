require 'rails_helper'

RSpec.describe "'/backgrounds' endpoint" do
  it 'can get forcast for that location', :vcr do
    get "/api/v1/backgrounds?location=denver,co"
    
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:url]).to_not be_empty
  end
end