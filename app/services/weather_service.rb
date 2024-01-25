class WeatherService
  BASE_URL = 'http://dataservice.accuweather.com/'
  PART_URL_CURRENT = 'currentconditions/v1/'
  PART_URL_FORECAST = 'forecasts/v1/daily/1day/'
  PART_HISTORICAL = '/historical/24'
  LOCATION_ID = '294021' # Moscow
  API_KEY = 'Pr5CxVQyD0UhpAEYa9hADOeaKa0SFKWG'
  METRIC = 'true'

  def get_data
    uri = URI(url)
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
  end

  def closest_to(time)
    raise NotImplementedError, 'You must implement the closest_to method'
  end

  def url
    raise NotImplementedError, 'You must implement the url method'
  end
end
