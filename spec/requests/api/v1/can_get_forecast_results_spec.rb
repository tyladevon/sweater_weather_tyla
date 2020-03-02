require 'rails_helper'

RSpec.describe "'/forcast/location' endpoint" do
  it 'can get forcast for that location', :vcr do
    # response = File.read('spec/fixtures/forecast_denver.json')

    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    data = JSON.parse(response, symbolize_names: true)
    # binding.pry
    # expect(response).to have_content("Denver, CO")
    # expect(response).to have_content("Current Weather")
  end
end