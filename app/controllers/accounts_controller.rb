class AccountsController < ApplicationController
  skip_before_action :authorize, :only => 'create'

    def create
      new_account = Account.create!(account_params)
      session[:account_id] = new_account.id
      render json: new_account, status: :created
    end

    def show
        if params[:id]
          user = Account.find(params[:id])
          render json: user, serializer: CurrentUserSerializer
        else
          render json: @current_user, serializer: CurrentUserSerializer
        end
    end

    def update
      @current_user.update!(account_params)
      render json: @current_user, serializer: CurrentUserSerializer
    end

    def followees 
        render json: @current_user.followees
    end

    
    
    private 

    def account_params
      params.permit(
        :first_name,
        :last_name,
        :email,
        :username,
        :password,
        :password_confirmation,
        :account_access,
        :bio,
        :image_url
      )
    end

end
