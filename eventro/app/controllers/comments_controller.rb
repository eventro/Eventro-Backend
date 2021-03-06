class CommentsController < ApplicationController
  before_action :require_token, except: [:index]
  before_action :set_event, only: [:index]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @current_user.comments.create(comment_params)
    render json: @comment
  end

  def index
    @comments = @event.comments
    # @comments = Comment.where(:event_id => @event.id)
    render json: @comments
  end

  def destroy
    if @comment.user_id == @current_user.id
      @comment.destroy
      render json: {message: "Success"}
    else
      render json: {errors: "Unauthorized"}, status: :unauthorized
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    # params.require(:comment).permit(:user_id, :event_id, :message)
    {
      
      event_id: params[:event_id],
      message: params.require(:message)
    }
  end
end
