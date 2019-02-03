class EventsController < ApplicationController
   before_action :requireO_token 
  before_action :set_event, only: [:show, :update, :destroy]


  def all_events 
    @events = Event.all
    render json: @events
  end

  def index
    @events = @current_Org.events
    render json: @events
  end

  def show
    render json: @event
end

  def count_events
    @events = Event.where(:organizer_id => @current_Org.ids).count
    render json: @events
  end

  def create
    @event = Event.create(event_params)
    render json: @event
  end

  def destroy
    @event.destroy
    render json: {message: "Success"}
  end

  def update 
    @event.update_attributes(event_params)
    render json: @event
end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, :location, :location_id, :logo, params[:id])
  end
end








