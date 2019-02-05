class LikesController < ApplicationController
  before_action :require_token
  before_action :set_event, only: :count
  before_action :set_like, only: :destroy

  def create
    @like = @current_user.likes.create!(like_params)
    render json: @like
  end

  def destroy
    if @like
      if @like.user_id == @current_user.id
        @like.destroy
        render json: {message: "Deleted like successfully"}
      end
    else
      render json: {message: "Can't destroy, already not liked"}
    end
  end

  def count
    @likecount = @event.likes.count
    render json: @likecount
  end

  private

  def set_like
    @event = Event.find(params[:event_id])
    @like = Like.find_by({user_id: @current_user.id, event_id: @event.id})
  end

  def like_params
    {
      event_id: params[:event_id],
    }
  end
end
