class ForecastService
  def initialize(location, time)
    @lat = location[:results].first[:geometry][:location][:lat]
    @lon = location[:results].first[:geometry][:location][:lng]
    @time = time
  end
  
  def forecast
    conn 
  end 

  def roadtrip 
    roadtrip_connection
  end

  private

  def roadtrip_connection
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{@lat},#{@lon},#{@time}") do |req|
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    response = Faraday.get("https://api.darksky.net/forecast/#{ENV['DARKSKY_API']}/#{@lat},#{@lon}") do |req|
    end
    JSON.parse(response.body, symbolize_names: true)
  end 
end 