require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET #current' do
    it 'returns a successful response' do
      get :current
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #historical' do
    it 'returns a successful response' do
      get :historical
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #historical_min' do
    it 'returns a successful response' do
      get :historical_min
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #historical_max' do
    it 'returns a successful response' do
      get :historical_max
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #historical_avg' do
    it 'returns a successful response' do
      get :historical_avg
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #by_time' do
    it 'returns a successful response' do
      get :by_time, params: { date: '2022-12-31', time: '12:00' }
      expect(response).to have_http_status(:success)
    end
  end
end
