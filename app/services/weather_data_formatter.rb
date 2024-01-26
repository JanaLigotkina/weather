class WeatherDataFormatter
  def initialize(data, options={})
    @data = data
    @time = options[:time]
    @min_max = options[:min_max]
  end

  def format
    case
    when @time
      format_closest_to_time
    when @min_max
      format_min_max
    else
      @data.map { |data_item| format_data_item(data_item) }
    end
  end

  private

  def format_closest_to_time
    closest_item = find_closest_to_time
    return unless closest_item

    format_data_item(closest_item)
  end

  def find_closest_to_time
    time_interval = 15 * 60 # 15 minutes

    @data.find do |item|
      time_difference = (item['EpochTime'] - @time).abs
      time_difference <= time_interval
    end
  end

  def format_min_max
    @data["DailyForecasts"][0]["Temperature"][@min_max]["Value"]
  end

  def format_data_item(data_item)
    {
      date: format_date(data_item['LocalObservationDateTime']),
      temperature: data_item['Temperature']['Metric']['Value'],
      temperature_unit: data_item['Temperature']['Metric']['Unit'],
      weather: data_item['WeatherText']
    }
  end

  def format_date(date_string)
    DateTime.parse(date_string).strftime('%d/%m/%Y %H:%M')
  end
end
