require 'spec_helper'

describe WeatherServiceHistoricalDetails do
  describe '#get_data_with_caching' do
    it 'returns the correct data' do
      VCR.use_cassette('weather_service_historical_details') do
        service = WeatherServiceHistoricalDetails.new
        data    = service.get_data_with_caching
        expect(data).to be_a(Hash)
      end
    end
  end

  describe '#url' do
    it 'returns the correct url' do
      service      = WeatherServiceHistoricalDetails.new
      expected_url = "#{WeatherServiceHistoricalDetails::BASE_URL}" +
        "#{WeatherServiceHistoricalDetails::PART_URL_FORECAST}" +
        "#{WeatherServiceHistoricalDetails::LOCATION_ID}" +
        "?apikey=#{WeatherServiceHistoricalDetails::API_KEY}" +
        "&metric=#{WeatherServiceHistoricalDetails::METRIC}"
      expect(service.url).to eq(expected_url)
    end
  end
end
