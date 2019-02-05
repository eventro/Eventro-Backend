class FollowsController < ApplicationController
    before_action :require_token, only: [:create, :destroy]
    before_action :set_follow, only: :destroy
    before_action :set_user, except: [:destroy]
    # before_action :set_user, only: [:countforfollowees, :countforfollowers, :indexforfollowees, :indexforfollowers]

    def create
        # @follow = @current_user.followees.create!(follow_params)
        @follow = Follow.create!(follow_params)
        # byebug
        render json: @follow
    end

    def destroy
      if @follow
         if @follow.follower_id == @current_user.id
              @follow.destroy
              render json: {message: "Unfollow successful"}
           end
      else
              render json: {message: "Can't unfollow, already not friend"}
          end
    end
    
    def countforfollowees
        @follow = @user.followees.count
        render json: @follow
    end

    def countforfollowers
        @follow = @user.followers.count
        render json: @follow
    end

    def indexforfollowees
        @follows = @user.followees
        render json: @follows
    end

    def indexforfollowers
        @follow = @user.followers
        render json: @follow
    end



    private

    def follow_params
        puts @current_user.id
        puts @user.id
        {
            follower_id: @current_user.id,
            followee_id: @user.id
        }
    end
    def set_follow
        @follow = Follow.find_by({follower_id: @current_user.id, followee_id: params[:user_id]})
    end
    def set_user
        @user = User.find(params[:user_id])
    end
end
