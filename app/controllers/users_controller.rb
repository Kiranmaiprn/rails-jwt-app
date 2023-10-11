class UsersController < ApplicationController
    require "rest-client"
    def index
        @users = User.all
        render json: @users, status: 200
    end

    def get_first_api
        RestClient.get("https://shibe.online/api/shibes?count=1")
        render json: response, status: 200
    end
end
