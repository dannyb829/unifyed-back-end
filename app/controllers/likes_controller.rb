class LikesController < ApplicationController


    def create 
        new_like = @current_user.likes.create(likeable_type: params[:type],
            likeable_id: params[:type_id])
        if new_like.save 
            new_like.create_activity(:create, owner: @current_user, recipient: new_like.likeable.class == Headline ? new_like.likeable : new_like.likeable.account)
            render json: new_like.likeable, status: :created
        else 
            render json: {error: "Something went wrong"}, status: :conflict
        end    
    end
    
    def destroy
    like = @current_user.likes.find_by(likeable_type: params[:type],
            likeable_id: params[:type_id])
    if like
    like.destroy
    head :ok
    else
        render json: {error: "Something went wrong"}, status: :not_found
    end
    end 

end
