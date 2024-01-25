class WeatherServiceByTime < WeatherService
  def initialize(historical_hourly_data)
    @historical_hourly_data = historical_hourly_data
  end

  def closest_to(time)
    @historical_hourly_data.each do |item|
      return item["Temperature"]["Metric"]["Value"] if item['EpochTime'] == time.to_i
    end

    nil
  end
end
