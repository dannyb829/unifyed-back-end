class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]


  def create
    user = Account.find_by(username: params[:username])
    if user&.valid_password?(params[:password])
      if user.confirmed?
        user.last_sign_in_at = Time.now
        render json: {'user': user, 'token': encode_token({'id': user.id,'username': user.username})}, status: :created
      else
        render json: {error: "Check your email for confirmation"}, status: 401
      end  
    else 
      render json: {error:'Invalid Username or Password'}, status: 401
    end
  end

  def destroy
    # will implement blacklist for logged out jwt tokens
    render json: {message: 'You have logged out'}, status: 200
  end
  

end
