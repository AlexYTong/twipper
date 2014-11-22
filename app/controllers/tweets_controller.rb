class TweetsController < ApplicationController
    def new
        @tweet = Tweet.new
    end

    def create 
        @tweet = Tweet.create(tweet_params)
        flash[:success] = "You have created"
        render 'new'
    end

    def update
        @tweet = Tweet.update(:id, tweet_params)
        flash[:success] = "You have updated"
        render 'new'
    end

    def tweet_params
        params.require(:tweet).permit(:tweet)
    end
end
