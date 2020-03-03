class BackgroundFacade 
  def initialize(location)
    @location = location
  end 

  def image
    Background.new(url)
  end

  private

  def url
    BackgroundService.new(@location).format_url
  end
end