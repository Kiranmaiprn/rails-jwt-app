class PostsController < ApplicationController
    before_action :authenticate_user!
    require "rest-client"
    def index
        @posts = current_user.posts
        render json: @posts
    end
    def show
        @post = current_user.posts.find(params[:id])
        render json: @post 
    end

    def create
        @post = current_user.posts.new(post_params)
        @post.save
        response=RestClient.get("https://shibe.online/api/shibes?count=1")
        render json: response
        # if @post.save
        #     render json: @post
        # else
        #     render json: @post.errors
        # end
    end

    def destroy
        @post=current_user.posts.find(params[:id])
        @post.destroy
        render json: current_user
    end
    


    private
    def post_params
        params.require(:post).permit(:name)
    end

end
