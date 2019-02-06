class AttendeesController < ApplicationController
  before_action :require_token, except: [:index_user, :index_event, :count]
  before_action :set_event, only: [:index_event, :count, :create, :destroy, :set_attendee]
  before_action :set_attendee, only: :destroy

  def create
    @attend = @current_user.attendees.create!(attendee_params)
    render json: @attend
  end

  def destroy
    if @attendee
      if @attendee.user_id == @current_user.id
        @attendee.destroy
        render json: {message: "Deleted attendee successfully"}
      end
    else
      render json: {message: "Can't destroy, already not attending"}
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
    # byebug
    @event = Event.find(params[:event_id])
    @attendee = Attendee.find_by({user_id: @current_user.id, event_id: @event.id})
  end

  def attendee_params
    {
      event_id: params[:event_id],
    }
  end
end
