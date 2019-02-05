class EventImagesController < ApplicationController
    before_action :require_token
    before_action :set_event, only:  :index
    
    
      def index
        @images = @event.event_images
      #  @images = EventImage.where(:event_id => @event).all
       render json: @images
      end
    
      def create
        @image = @current_user.event_images.create(set_params)
        render json: @image
      end
    
      def destroy
       @image
          @image.destroy
          render json: {message: "Success"}
        end
      end
    
    
      private
    
      def set_params
        {
          user_id: params[:id],
          event_id: params[:event_id],
          image: params.require(:image).permit(:i)
        }
      end
     
      def image_params
        params.permit(:image)
      end
    
   