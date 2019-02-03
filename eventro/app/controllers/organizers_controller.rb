class OrganizersController < ApplicationController
    before_action :requireO_token, only: [:show, :update]
    before_action :set_organizer, only: [:update]

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

  private

  def organizer_params
    params.require(:organizer).permit( :email, :password , :name , :phone)
  end

  def set_organizer
    @organizer = Organizer.find(params[:id])
  end

end
