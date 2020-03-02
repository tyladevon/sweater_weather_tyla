class Forecast
  attr_reader :id, :current, :details, :forecast
  def initialize(data, location)
    @data = data
    @id = id
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
    forecast_info = {}
    data[:hourly][:data][1..8].map do |info|
      forecast_info[:hourly] =
      { time: info[:time],
        temperature: info[:temperature]
      }
    end[0..7]

    data[:daily][:data].map do |info|
      forecast_info[:weekly] =
      { day: info[:daily][:data][:time],
        forecast_icon: info[:daily][:data][:icon],
        forecast: info[:daily][:data][:summary],
        precip: number_to_percentage(info[:daily][:data][:precipProbability]),
        precip_icon: (info[:daily][:data][:precipType]),
        high: info[:daily][:data][:temparatureHigh],
        low: info[:daily][:data][:temparatureLow]
      }
    end[1..5]
    forecast_info
  end 

  private 
  attr_reader :data, :location
end