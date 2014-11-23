class RelationshipsController < ApplicationController
    def create

        @relationship = Relationship.new(rel_params)
        @relationship.follower_id = current_user
        @user = User.find(@relationship.followed_id)

        current_user.follow(@user)
        if @relationship.save
            flash[:success] = "You are now following #{@user.email}" 
        else
            flash[:danger]  = "The user cannot be followed at this time"
        end

        redirect_to tweets_path
    end

    def rel_params
        params.require(:relationship).permit(:followed_id)
    end
end
