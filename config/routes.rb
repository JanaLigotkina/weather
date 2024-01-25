Rails.application.routes.draw do
  root 'weather#index'

  scope 'weather', controller: :weather do
    get :current
    get 'by_time', as: 'by_time_weather'
    get 'historical', :historical
    get 'historical/max' => :historical_max
    get 'historical/min' => :historical_min
    get 'historical/avg' => :historical_avg
  end

  get "health" => 'health#show'
end
