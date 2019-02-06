class OrganizersController < ApplicationController
  before_action :requireO_token, only: [:update, :destroy]
  before_action :set_organizer, only: [:update, :destroy]

    def index
      @organizers = Organizer.all
      render json: @organizers
    end
  def show
    if params[:id] == @current_org.id.to_s
      render json: @current_org
    else
      render json: {errors: "invalid organizer"}, status: :unauthorized
    end
  end

  def create
    @organizer = Organizer.create!(organizer_params)
    render json: @organizer
  end

  def update
    if params[:id] == @current_org.id.to_s
      @organizer.update_attributes(organizer_params)
      render json: @organizer
    end
  end

  def destroy
    if ((@current_org.id) == (@organizer.id))
      @organizer.destroy
      render json: {message: "delete successful"}
    else
      render json: {errors: "Unauthorized"}, status: :unauthorized
    end
  end

  private

  def organizer_params
    params.require(:user).permit(:email, :password, :name, :phone)
  end

  def set_organizer
    @organizer = Organizer.find(params[:id])
  end
end
