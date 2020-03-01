class Forecast
  attr_reader :id, :current, :details, :forecast
  def initialize(data)
    @id = id
  end

  def current
    binding.pry
    current_info = {
      summary: data[:daily][:summary],
      icon: data[:daily][:icon],
      temperature: data[:currently][:temperature],
      high: data[:daily][:data][:temperatureHigh],
      low: data[:daily][:data][:temperatureLow],
      location: ,
      time: 
    }
  end 

  def details
    detail_info = {
      summary: ,
      icon: ,

    }
  end 

  def forecast

  end 
end 