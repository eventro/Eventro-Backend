class EventImagesController < ApplicationController
  before_action :require_token , except: [:index]
  before_action :set_event, only: :index
  before_action :set_image, only: :destroy

  def index
    @images = @event.event_images
    #  @images = EventImage.where(:event_id => @event).all
    render json: @images
  end

  def create
    @image = @current_user.event_images.create(image_params)
    render json: @image
  end

  def destroy
    # if @image.user_id == @current_user.id
    @image.destroy
    render json: {message: "Success"}
    # end
  end

  private

  # def set_params
  #   {
  #         event_id: params.require(:event_id),
  #         image: params.require(:image),
  #       }
  # end
  def set_image
    @image = Event_image.find(params[:id])
  end

  def image_params
    params.require(:event_image).permit(:image, :event_id)
  end
end
