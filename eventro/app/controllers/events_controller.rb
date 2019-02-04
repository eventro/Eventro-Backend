class EventsController < ApplicationController
<<<<<<< HEAD
  before_action :requireO_token , except: [:all_events , :show , :user_events]
  before_action :set_event, only: [:show, :update, :destroy]

  def all_events 
=======
  before_action :requireO_token, except: [:all_events, :show, :user_events]
  # before_action :require_token, only: [:user_events]
  before_action :set_event, only: [:show, :update, :destroy]
  # before_action :set_event, only: [:show, :update, :destroy, :remove_event]

  def all_events
>>>>>>> a9f8d78f9cb17b18b819d27d48b9eacef7d76073
    @events = Event.all
    render json: @events
  end

  def index
    @events = @current_org.events
    render json: @events
  end

<<<<<<< HEAD
=======
  # same concept will be in the attendance

  # def user_events
  #   @events = @current_user.events
  #   render json: @events
  # end

  # def remove_event
  #   @event.destroy
  #   render json: {message: "Success"}
  # end

>>>>>>> a9f8d78f9cb17b18b819d27d48b9eacef7d76073
  def show
    render json: @event
  end

  def count_events
    @events = Event.where(:organizer_id => @current_org.id).count
    render json: @events
  end

  def create
    @event = @current_org.events.create(event_params)
    render json: @event
  end

  def destroy
    if(@event.organizer_id == @current_org.id)
    @event.destroy
    render json: {message: "Success"}
    end
  end

  def update
    @event.update_attributes(event_params)
    render json: @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :location, :location_id, :logo, params[:id])
  end
end
