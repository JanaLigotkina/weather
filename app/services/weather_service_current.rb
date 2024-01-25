class WeatherServiceCurrent < WeatherService
  def url
    "#{BASE_URL}#{PART_URL_CURRENT}#{LOCATION_ID}?apikey=#{API_KEY}&details=#{METRIC}"
  end
end
