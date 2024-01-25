class WeatherServiceHistoricalDetails < WeatherService
  def url
    "#{BASE_URL}#{PART_URL_FORECAST}#{LOCATION_ID}?apikey=#{API_KEY}%20&metric=#{METRIC}"
  end
end
