class WeatherController < ApplicationController
  include Constants

  before_action :set_historical_hourly_data, only: [:historical, :historical_avg, :by_time]
  before_action :set_historical_details_data, only: [:historical_max, :historical_min]
  def current
    current_data = WeatherServiceCurrent.new.get_data_with_caching
    format_and_render(current_data, 'weather/current')
  end

  def historical
    format_and_render(@historical_hourly_data, 'weather/historical')
  end

  def historical_min
    format_and_render(@historical_details_data, 'weather/historical_max', min_max: "Minimum")
  end

  def historical_max
    format_and_render(@historical_details_data, 'weather/historical_max', min_max: "Maximum")
  end

  def historical_avg
    average_temperature = calculate_average_temperature(@historical_hourly_data)
    render 'weather/historical_avg', locals: { average_temperature: average_temperature }
  end

  def by_time
    epoch_time = convert_to_epoch_time(date_and_time_params[:date], date_and_time_params[:time])
    weather = WeatherServiceByTime.new(@historical_hourly_data).closest_to(epoch_time)

    if weather.nil?
      render 'errors/404', locals: { error_message: 'Not Found' }
    else
      render 'weather/by_time', locals: { weather: weather }
    end
  end

  private

  def date_and_time_params
    params.permit(:date, :time)
  end

  def set_historical_hourly_data
    @historical_hourly_data ||= WeatherServiceHistoricalHourly.new.get_data_with_caching
  end

  def set_historical_details_data
    @historical_details_data ||= WeatherServiceHistoricalDetails.new.get_data_with_caching
  end

  def format_and_render(data, template, options = {})
    formatter = WeatherDataFormatter.new(data, options)
    formatted_data = formatter.format

    render template, locals: { formatted_data: formatted_data }
  end

  def convert_to_epoch_time(date, time)
    datetime = Time.strptime("#{date} #{time}", "%Y-%m-%d %H:%M").in_time_zone(Time.zone.name).in_time_zone(CITY_NAME)
    datetime.strftime('%s').to_i
  end

  def calculate_average_temperature(data)
    sum = 0
    count = data.size

    data.each do |item|
      sum += item["Temperature"]["Metric"]["Value"]
    end

    (sum/count).round(2)
  end
end
