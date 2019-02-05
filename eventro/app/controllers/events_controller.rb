class EventsController < ApplicationController
  before_action :requireO_token , except: [:all_events, :show  , :user_events]
  before_action :set_event, only: [:update, :destroy]
  before_action :find_params, only: :show

  def all_events 
    @events = Event.all
    render json: @events
  end

  def index
    @events = @current_org.events
    render json: @events
  end

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
  def find_params
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :location, :location_id, :logo, :image_url, params[:id])
  end
end
