class GeolocationService 
  def initialize(location)
    @location = location
  end

  def format
    response = conn.get(endpoint_info) do |req|
      req.params['address'] = @location
      req.params['key'] = ENV['GOOGLE_GEO_API']
    end
    JSON.parse(response.body, symbolize_names: true)
  end 

  private 

  def conn
    Faraday.new("https://maps.googleapis.com")
  end

  def endpoint_info
    "/maps/api/geocode/json?"
  end 
end 