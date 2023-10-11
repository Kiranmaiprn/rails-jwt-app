class WeathersController < ApplicationController
    def index
      api_key = '3478149057ae5f6f761c232781845530'
      api = WeatherApi.new(api_key)
      @weather = api.weather_by_city('Hyderabad')
      render json: @weather
      # @response = FaradayApi.post_employee
      # render json: @response
    end
  end