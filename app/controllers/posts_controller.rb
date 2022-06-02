class PostsController < ApplicationController
    def create 
        post = Post.create!(account:@current_user, content: params[:content],author: @current_user.first_name)
        activity = post.create_activity(:create, owner: @current_user)
        render json: activity, include: [:owner, :recipient, :trackable], status: :created
    end

    def destroy
        post = Post.find(params[:id])
        post.activities.destroy_all
        post.destroy
        render json: {}, status: :no_content
    end

    private

    def post_params
        params.permit(:content)
    end

end
