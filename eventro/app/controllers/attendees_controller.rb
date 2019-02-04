class AttendeesController < ApplicationController
  before_action :require_token
  before_action :set_event, only: [:index_event, :count, :create, :destroy, :set_attendee]

  def create
    @attend = @current_user.attendees.create(attendee_params)
    render json: @attend
  end

  def destroy
    if @attendee.user_id == @current_user.id
      @attendee.destroy
      render json: {message: "Success"}
    else
      render json: {errors: "Unauthorized"}, status: :unauthorized
    end
  end

  def index_user
    @events_attended = @current_user.events
    render json: @events_attended
  end

  def index_event
    @users_attending = @event.users
    render json: @users_attending
  end

  def count
    @count = @event.attendees.count
    render json: @count
  end

  private

  def set_attendee
    @attendee = Attendee.where((user_id == @current_user.id) && (event_id == @event.id))
  end

  def attendee_params
    {
      event_id: params[:event_id]
    }
  end
end
