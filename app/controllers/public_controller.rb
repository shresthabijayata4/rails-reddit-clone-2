class PublicController < ApplicationController

    def index
        @communities = Community.all.limit(10)
        @posts = Post.order(created_at: :desc).limit(20)
    end

    def profile
        @profile = Account.find_by_username params[:username]
        @posts = @profile.posts
      
    end
end
