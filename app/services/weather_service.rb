require 'net/http'
require 'json'

class WeatherService
  include Constants
  
  def get_data
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def closest_to(time)
    raise NotImplementedError, 'You must implement the closest_to method'
  end

  def url
    raise NotImplementedError, 'You must implement the url method'
  end
end
