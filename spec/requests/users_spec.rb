require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get "/users"
      expect(response).to have_http_status(200)
    end
  end

  # describe "/users/[user id] as manager" do
  #   it "Shows 'you' on your page" do
  #     VCR.use_cassette("avatar_upload") do        
  #       get "/get_first_api"
  #       expect(response).to have_http_status(200)
  #     end
  #   end
  # end

end
