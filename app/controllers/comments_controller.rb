class CommentsController < ApplicationController
    def create 
        new_comment = Comment.create!(account:@current_user, 
            commentable_id:params[:id],
            commentable_type: params[:type], 
            content:params[:content])
        new_comment.create_activity(:create, owner: @current_user, recipient: new_comment.commentable)
        render json: new_comment, include: [:account, :likes], status: :created
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        head :no_content
    end

    private 

    def comment_params
        params.permit(:id, :type, :content)
    end

end
