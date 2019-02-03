class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    def require_token
        token = params.require(:authentication_token)
        @current_user = User.find_by( authentication_token: token )
        unless @current_user 
          render json: { errors: "invalid token" }, status: :unauthorized
        end
      end

      def requireO_token
        token = params.require(:authentication_token)
        @current_Org = Organizer.find_by( authentication_token: token )
        unless @current_Org 
          render json: { errors: "invalid token" }, status: :unauthorized
        end
      end


    
      rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
        render json: { errors: parameter_missing_exception }, status: :unprocessable_entity
      end
    
      rescue_from(ActiveRecord::RecordNotFound) do |missing_record_exception|
        render json: { errors: missing_record_exception }, status: :not_found
      end
    
      rescue_from(ActiveRecord::RecordInvalid) do |invalid_record_exception|
        render json: { errors: invalid_record_exception.record.errors.messages }, status: :bad_request
      end
end
