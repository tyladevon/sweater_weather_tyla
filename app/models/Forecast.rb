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
    binding.pry
    forecast_info = { hourly: 
      [
        { hour_1: data[:hourly][:data][:time],
        temperature: data[:hourly][:data][:temperature]},
        # {
        #   # hour_2: data[:],
        # },
        # {hour_3: ,},
        # {hour_4: ,},
        # {hour_5: ,},
        # {hour_6: ,}, 
        # {hour_7: ,}, 
        # {hour_8: }
    ]
    }
  end 

  private 
  attr_reader :data, :location
end