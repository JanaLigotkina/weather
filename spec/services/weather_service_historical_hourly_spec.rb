require 'spec_helper'

describe WeatherServiceHistoricalHourly do
  describe '#get_data_with_caching' do
    it 'returns the correct data' do
      VCR.use_cassette('weather_service_historical_hourly') do
        service = WeatherServiceHistoricalHourly.new
        data    = service.get_data_with_caching
        expect(data).to be_a(Array)
      end
    end
  end

  describe '#url' do
    it 'returns the correct url' do
      service      = WeatherServiceHistoricalHourly.new
      expected_url = "#{WeatherServiceHistoricalHourly::BASE_URL}" +
        "#{WeatherServiceHistoricalHourly::PART_URL_CURRENT}" +
        "#{WeatherServiceHistoricalHourly::LOCATION_ID}" +
        "#{WeatherServiceHistoricalHourly::PART_HISTORICAL}" +
        "?apikey=#{WeatherServiceHistoricalHourly::API_KEY}" +
        "&details=#{WeatherServiceHistoricalHourly::METRIC}"
      expect(service.url).to eq(expected_url)
    end
  end
end
