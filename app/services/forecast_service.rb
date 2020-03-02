class ForecastService
  def initialize(location)
    @lat = location[:results].first[:geometry][:location][:lat]
    @lon = location[:results].first[:geometry][:location][:lng]
  end
  
  def forecast
    conn 
  end 

  private

  def conn
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{@lat},#{@lon}") do |req|
    end
    JSON.parse(response.body, symbolize_names: true)
  end 
end 