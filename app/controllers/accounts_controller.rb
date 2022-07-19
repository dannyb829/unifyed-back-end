class AccountsController < ApplicationController
  skip_before_action :authorize, :only => 'create'
  

    def create
      new_account = Account.create!(account_params)
      render json: { message: "Check email to confirm account"}, status: :created
    end

    def show
        if params[:id]
          user = Account.find(params[:id])
          render json: user, serializer: AccountSerializer
        else
          render json: @current_user, serializer: AccountSerializer
        end
    end

    def update
      @current_user.update!(account_params)
      render json: @current_user, serializer: AccountSerializer
    end

    def followees 
        render json: @current_user.followees
    end

    def search_results
      results = Account.where("LOWER(first_name) LIKE ?", "%#{params[:search]}%")
      render json: results, status: :ok
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
