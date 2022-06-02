class FriendshipsController < ApplicationController

    def create 
        friend = Account.find(params[:id])
        follow = Friendship.create!(follower: @current_user,followee: friend)
        follow.create_activity(:create, owner: @current_user, recipient: friend)
        render json: friend, status: :created
    end

    def destroy
        friend = Account.find(params[:id])
        follow = Friendship.find_by!(follower: @current_user, followee: friend)
        follow.activities.destroy
        follow.destroy
        render json: friend, status: :ok
    end

    private

    def friend_params
        params.permit(:id)    
    end

end
