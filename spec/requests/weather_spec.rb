require 'rails_helper'

RSpec.describe "Weathers", type: :request do
  describe "GET /index" do
    it "get weather of hyderabad" do 
      VCR.use_cassette("weather_api") do
        get "/weather_api" 
        expect(response).to have_http_status(200)
      end
    end
  end
end
