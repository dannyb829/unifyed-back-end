class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include ActionController::Cookies
    include PublicActivity::StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActionController::RoutingError, with: :route_not_found

    before_action :authorize
    before_action :set_current_user

    private

    def set_current_user
        Current.user = @current_user
    end

    def route_not_found
        render json: {error: 'Routing Error'}, status: 400
    end

    def record_not_found
        render json: {error: "#{controller_name.classify} not found"}, status: :not_found
    end
    
    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: 422
    end

    def encode_token(user_data={})
        expiration = 24.hours.from_now
        user_data[:expiration] = expiration.to_i
        
        JWT.encode(user_data,Rails.application.credentials.config[:secret_key_base], 'HS256')
      end

     # Rails.application.secrets.secret_key_base
    def decode
        token = request.headers["Authorization"] || params['Authorization']
        JWT.decode(token,Rails.application.credentials.config[:secret_key_base], true, {algorithm:'HS256'})[0]
    end

    def authorize
        @current_user = Account.find_by_id(decode['id'])
        render json: {error:'Not Authorized'}, status: 401 unless @current_user
    end

end
