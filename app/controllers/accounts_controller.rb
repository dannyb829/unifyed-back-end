class AccountsController < ApplicationController
  skip_before_action :authorize, only: [:create]

    def create
      new_account = Account.create!(new_account_params)
      session[:account_id] = new_account.id
      render json: new_account, status: :created
    end

    def show
        if params[:id]
          user = Account.find(params[:id])
          render json: user
        else
          render json: @current_user
        end
    end
    
    private 

    def new_account_params
      params.permit(
        :first_name,
        :last_name,
        :email,
        :username,
        :password,
        :password_confirmation,
        :account_access
      )
    end

end
