class Forecast
  attr_reader :id, :current, :details, :forecast
  def initialize(data, location)
    @location = location
    @data = data
    @id = nil
  end
  
  def current
    {
      summary: data[:daily][:summary],
      icon: data[:daily][:icon],
      temperature: data[:currently][:temperature],
      high: data[:daily][:data].first[:temperatureHigh],
      low: data[:daily][:data].first[:temperatureLow],
      location: location,
      time: Time.at(data[:currently][:time]).strftime('%-I:%M%p, %m/%d')
    }
  end 
  
  def details
    {
      summary: data[:daily][:summary],
      icon: data[:daily][:icon],
      feels_like: data[:currently][:apparentTemperature],
      humidity: data[:currently][:humidity],
      visibility: data[:currently][:visibility],
      uv_index: data[:currently][:uvIndex],
      today: data[:daily][:summary],
      tonight: data[:daily][:data].last[:summary]
    }
  end 

  def forecast
    [data[:hourly][:data].map do |info|
      { time: info[:time],
        temperature: info[:temperature]
      }
    end[1..8],
    data[:daily][:data].map do |info|
      { day: info[:time],
        forecast_icon: info[:icon],
        forecast: info[:summary],
        precip: info[:precipProbability],
        precip_icon: (info[:precipType]),
        high: info[:temperatureHigh],
        low: info[:temperatureLow]
      }
    end[1..5]
    ]
  end 

  private 
  attr_reader :data, :location
end