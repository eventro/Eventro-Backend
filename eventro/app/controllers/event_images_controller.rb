class EventImagesController < ApplicationController

    # before_action :requireO_token , except: [:all_events , :show , :user_events]
    before_action :set_event, only: [ :index]
    before_action :set_img, only: [ :destroy]
    
      def index
       @images = EventImage.where(:event_id => @event).all
       render json: @images
      end
    
      def create
       logger.info( @event)
        @image = @event.event_images.create(image_params)
        render json: @image
      end
    
      def destroy
        @img.destroy
        render json: {message: "Success"}
      end
    
    
      private
      def set_event
        @event = Event.find(params[:id])
      end
    
      def set_img
        @img = EventImage.find(params[:id])
      end
    
      def image_params
        params.permit(:image)
      end
    
    end
    