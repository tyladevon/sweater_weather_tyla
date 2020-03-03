class BackgroundService
  def initialize(location)
    @location = location
  end

  def format_url
    response = conn.get('/v1/search') do |req|
      req.params['per_page'] = 1
      req.params['query'] = @location
      req.headers['Authorization'] = ENV['PEXELS_AUTHORIZATION']
    end
    JSON.parse(response.body, symbolize_names: true)[:photos].first[:url]
  end

  private

  def conn
    Faraday.new('https://api.pexels.com')
  end
end