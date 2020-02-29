class Forecast
  attr_reader :id, :current, :details, :forecast
  def initialize(data)
    @id = id
  end

  def current
    binding.pry
    current_info = {
      summary: data[:currently][:summary],
      icon: data[:currently][:icon],
      temperature: data[:currently][:temperature]
    }
  end 

  def details

  end 

  def forecast

  end 
end 