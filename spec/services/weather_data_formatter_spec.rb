require 'rails_helper'

RSpec.describe WeatherDataFormatter, type: :service do
  let(:data) do
    [
      {
        'EpochTime'                => 1706184180,
        'LocalObservationDateTime' => '2022-09-01T10:00:00+03:00',
        'Temperature'              => {
          'Metric' => {
            'Value' => 10,
            'Unit'  => 'C'
          }
        },
        'WeatherText'              => 'Very Cold'
      }
    ]
  end

  describe '#format' do
    context 'when time is not provided' do
      let(:service) { described_class.new(data) }

      it 'returns formatted data' do
        expect(service.format).to eq([
                                       {
                                         date:             '01/09/2022 10:00',
                                         temperature:      10,
                                         temperature_unit: 'C',
                                         weather:          'Very Cold'
                                       }
                                     ])
      end
    end

    context 'when time is provided' do
      let(:service) { described_class.new(data, time: 1706184180) }

      it 'returns data closest to the provided time' do
        expect(service.format).to eq(
                                    {
                                      date:             '01/09/2022 10:00',
                                      temperature:      10,
                                      temperature_unit: 'C',
                                      weather:          'Very Cold'
                                    }
                                  )
      end
    end
  end
end
