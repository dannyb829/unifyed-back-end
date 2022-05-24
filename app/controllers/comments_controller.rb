class CommentsController < ApplicationController
    def create 
        new_comment = Comment.create!(account:@current_user, 
            headline_id:params[:id], 
            content:params[:content])
        render json: new_comment, include: [:account, :likes], status: :created
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        head :no_content
    end

end
