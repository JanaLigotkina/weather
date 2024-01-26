require 'net/http'
require 'json'
require 'redis'

class WeatherService
  include Constants

  def initialize
    @redis = Redis.new(host: "localhost", port: 6379)
  end

  def get_data_with_caching
    cached_data = @redis.get(cache_key)

    if cached_data
      JSON.parse(cached_data)
    else
      data = get_data
      @redis.setex(cache_key, 7200, data.to_json)
      data
    end
  end
  
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

  def cache_key
    raise NotImplementedError, 'You must implement the cache_key method'
  end
end
