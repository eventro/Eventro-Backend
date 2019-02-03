class UsersController < ApplicationController
    # NOT SURE IF WE NEED THE SKIP
#   skip_before_action :verify_authenticity_token, only: [:create] 
  before_action :require_token, only: [:show]

  def show
    if params[:id] == @current_user.id.to_s
      render json: @current_user
    else
      render json: {errors: "invalid user"}, status: :unauthorized
    end
  end

  def create
    @user = User.create!(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
