class TweetsController < ApplicationController

    before_action :authenticate_user!

    def new
        @tweet = Tweet.new
        @tweets = current_user.tweets

    end

    def create 
        @tweet = Tweet.new(tweet_params) 
        @tweet.user = current_user
        if @tweet.save
            flash[:success] = "You have created"
        else
            flash[:danger] = "please fix the problems below"
        end

        @tweets = current_user.tweets
        
        render 'new'
    end

    def update
        @tweet = Tweet.update(params[:id], tweet_params)
        @tweets = current_user.tweets
        flash[:success] = "You have updated"
        render 'new'
    end

    def index
        @tweets = Tweet.all.reject {|tweet| tweet.user == current_user}
        @relationship = Relationship.new
    end

    def tweet_params
        params.require(:tweet).permit(:tweet)
    end
end
