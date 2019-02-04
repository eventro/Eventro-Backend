class LikesController < ApplicationController
    before_action :require_token
    before_action :set_event, only: [:count]

    def create
       @like= @current_user.Like.Create(set_params)
        render Json: @like
    end

    def destroy
        # @like = Like.find_by(set_params)
        if  @like.user_id == @current_user.id
        @like.destroy
        render Json: {message: "Success"}

    end
    
    def count
        @like = @event.likes.count
    end

    private

    def set_params
        {
            event_id: params.require(:event_id)
            user_id: params.require(:user_id)
        }
    end
    
end
