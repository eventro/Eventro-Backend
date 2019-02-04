class FollowsController < ApplicationController
    before_action :require_token
    # before_action :set_user, only: [:countforfollowees, :countforfollowers, :indexforfollowees, :indexforfollowers]

    def create
        @follow = @current_user.Follow.Create(set_params)
        render Json: @follow
    end

    def destroy
        if @follow.followee_id == @current_user.id
        @follow.destroy
        render Json: {message: "Success"}
        end
    end
    
    def countforfollowees
        @follow = @current_user.followee.count
    end

    def countforfollowers
        @follow = @current_user.follower.count
    end

    def indexforfollowees
        @follow = @current_user.followee
    end

    def indexforfollowers
        @follow = @current_user.follower
    end



    private

    def set_params
        {
            followee_id: params.require(:followee_id)
            follower_id: params.require(:follower_id)
        }
    end
end
