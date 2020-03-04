class TravelTimeService 
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel 
    data = conn.get("/maps/api/directions/json") do |req|
    req.params['key'] = ENV['GOOGLE_DIRECTIONS_API']
    req.params[:origin] = @origin
    req.params[:destination] = @destination
    req.params[:departure_time] = 'now'
    end 
    JSON.parse(data.body, symbolize_names: true)
  end

  private 

  def conn 
    Faraday.new("https://maps.googleapis.com")
  end 
end