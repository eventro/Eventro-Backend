class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
        user = User.where(email: params[:email]).first
        if user
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [ :email, :authentication_token]),status: :created
        else
            render json: { errors: "Password incorrect" }, status: :unauthorized
          end 
        else 
          render json: { errors: "No user with that email" }, status: :unauthorized
        end
      end 


    def destroy

    end
end
