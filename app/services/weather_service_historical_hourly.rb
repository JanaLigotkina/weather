class WeatherServiceHistoricalHourly < WeatherService
  def url
    "#{BASE_URL}#{PART_URL_CURRENT}#{LOCATION_ID}#{PART_HISTORICAL}?apikey=#{API_KEY}&details=#{METRIC}"
  end
end
