class ForecastFacade
  def initialize(location)
    @location = location
  end
  
  def forecast
    Forecast.new(format_data, @location)
  end

  private
  attr_reader :location
  def format_data
    ForecastService.new(format_location).forecast
  end

  def format_location
    GeolocationService.new(location).format
  end
end