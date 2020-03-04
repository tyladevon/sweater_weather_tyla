class RoadTripFacade 
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def roadtrip
    time = format_travel_time[:text]
    forecast = format_arrival_forecast
    RoadTrip.new(@origin, @destination, time, forecast)
  end

  private
  def format_travel_time
    TravelTimeService.new(@origin, @destination).travel[:routes].first[:legs].first[:duration]
  end

  def format_arrival_forecast
    forecast_lookup = lookup_forecast
    summary = forecast_lookup[:currently][:summary]
    temp = forecast_lookup[:currently][:temperature]
    ForecastArrival.new(summary, temp)
  end
  
  def lookup_forecast
    location = format_location
    time = formatted_time
    ForecastService.new(location, time).roadtrip
  end

  def format_location
    GeolocationService.new(@destination).format
  end
  def formatted_time
    (Time.now + format_travel_time[:value]).to_i
  end
end