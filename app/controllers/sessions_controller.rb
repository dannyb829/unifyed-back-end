class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]

  def create
    user = Account.find_by(username: params[:username])
    if user&.valid_password?(params[:password]) 
      session[:account_id] = user.id
      render json: user, status: :created
    else render json: {error:'Invalid Username or Password'}, status: 401
    end
  end

  def destroy
    session.delete :account_id
    render json: {message: 'You have logged out'}, status: 200
  end

end
