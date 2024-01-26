Rails.application.routes.draw do
  root 'weather#index'

  scope 'weather', controller: :weather do
    get :current
    get 'by_time', as: 'by_time_weather'
    get 'historical', :historical
    get 'historical/max', to: 'weather#historical_max'
    get 'historical/min', to: 'weather#historical_min'
    get 'historical/avg', to: 'weather#historical_avg'
  end

  get '/health', to: 'application#health'
end
