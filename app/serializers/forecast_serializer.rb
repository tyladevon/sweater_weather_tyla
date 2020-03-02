class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current, :details, :forecast
end