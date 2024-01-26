class WeatherServiceByTime < WeatherService
  def initialize(historical_hourly_data)
    @historical_hourly_data = historical_hourly_data
  end

  def closest_to(time)
    formatter = WeatherDataFormatter.new(@historical_hourly_data, time: time)
    formatter.format
  end
end
