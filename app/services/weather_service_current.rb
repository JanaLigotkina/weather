class WeatherServiceCurrent < WeatherService
  def url
    "#{BASE_URL}#{PART_URL_CURRENT}#{LOCATION_ID}?apikey=#{API_KEY}&details=#{METRIC}"
  end

  def cache_key
    'current_weather_data'
  end
end
