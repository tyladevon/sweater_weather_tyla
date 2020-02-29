class ForecastService
  def initialize(location)
    @lat = location["results"].first["geometry"]["location"]["lat"]
    @lon = location["results"].first["geometry"]["location"]["lng"]
  end
  
  def forecast

  end 
end 