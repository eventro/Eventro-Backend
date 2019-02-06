class SessionsController < ApplicationController
  def create
    @user = User.find_by({email: session_params[:email]})
    if @user
      if @user.authenticate(session_params[:password])
        render json: @user
      else
        render json: {errors: "Password incorrect"}, status: :unauthorized
      end
    else
      render json: {errors: "No user with that email"}, status: :unauthorized
    end
  end

  def org_login
    @organizer = Organizer.find_by({email: session_params[:email]})
    if @organizer
      if @organizer.authenticate(session_params[:password])
        render json: @organizer
      else
        render json: {errors: "Password incorrect"}, status: :unauthorized
      end
    else
      render json: {errors: "No user with that email"}, status: :unauthorized
    end
  end

  private

  def session_params
    {
          email: params.require(:email),
          password: params.require(:password),
        }
  end
end
