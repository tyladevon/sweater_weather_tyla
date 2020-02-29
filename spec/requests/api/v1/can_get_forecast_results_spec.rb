require 'rails_helper'

RSpec.describe "'/forcast/location' endpoint" do
  it 'can get forcast for that location' do
    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    expect(response.body).to be_a(Hash)
    expect(response.body).to have_content("Denver, CO")
    expect(response.body).to have_content("Current Weather")
  end
end