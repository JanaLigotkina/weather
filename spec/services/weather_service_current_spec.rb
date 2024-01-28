require 'spec_helper'

describe WeatherServiceCurrent do
  describe '#get_data_with_caching' do
    it 'returns the correct data' do
      VCR.use_cassette('weather_service_current') do
        service = WeatherServiceCurrent.new
        data    = service.get_data_with_caching
        expect(data).to be_a(Array)
      end
    end
  end

  describe '#url' do
    it 'returns the correct url' do
      service      = WeatherServiceCurrent.new
      expected_url = "#{WeatherServiceCurrent::BASE_URL}" +
        "#{WeatherServiceCurrent::PART_URL_CURRENT}" +
        "#{WeatherServiceCurrent::LOCATION_ID}" +
        "?apikey=#{WeatherServiceCurrent::API_KEY}" +
        "&details=#{WeatherServiceCurrent::METRIC}"
      expect(service.url).to eq(expected_url)
    end
  end
end
