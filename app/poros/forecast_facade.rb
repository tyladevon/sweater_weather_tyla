class ForecastFacade
  def initialize(location)
    @location = location
  end
  
  def forecast
    ForecastService.new(format_location).forecast
  end

  private

  def format_location
    GeolocationService.new(@location).format
  end
end 