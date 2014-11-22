class TweetsController < ApplicationController
    def new
        @tweet = Tweet.new
        @tweets = Tweet.all
    end

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweets = Tweet.all
        flash[:success] = "You have created"
        render 'new'
    end

    def update
  #      @tweet = Tweet.update(, tweet_params)
        flash[:success] = "You have updated"
        render 'new'
    end

    def tweet_params
        params.require(:tweet).permit(:tweet)
    end
end
