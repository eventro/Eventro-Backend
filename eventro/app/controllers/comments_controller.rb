class CommentsController < ApplicationController
  before_action :require_token
  before_action :set_event, only: [:index]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.create(comment_body)
    render json: @comment
  end

  def index
    @comments = Comment.where(:event_id => @event.ids)
    render json: @comments
  end

  def destroy
    @comment.destroy
    render json: {message: "Success"}
  end

  private

  #   def set_event
  #     @event = Event.find(params[:event_id]) #???
  #   end

  def set_comment
    @comment = Comment.find(params[:comment_id]) #???
  end

  def comment_params
    {
      event_id: params.require(:event_id),
      user_id: params.require(:user_id),
    #   comment: params.require(:comment) #maybe?
    }
  end

  def comment_body
    params.require(:comment).permit(:comment)  #WHAT???
  end
end
