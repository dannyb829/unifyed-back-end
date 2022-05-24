class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    before_action :authorize

    private

    def record_not_found
        render json: {error: "#{controller_name.classify} not found"}, status: :not_found
    end
    
    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: 422
    end

    def authorize
        @current_user = Account.find_by_id(session[:account_id])
        render json: {error:'Not Authorized'}, status: 401 unless @current_user
    end

end
