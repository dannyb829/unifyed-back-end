class ConversationsController < ApplicationController
    
    def index 
        Conversation.where('sender_id = ? OR recipient_id = ?',Current.user.id,Current.user.id)
    end

    def create 
        if Conversation.between(params[:sender_id], params[:recipient_id]).present?
            @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
        else
            @conversation = Conversation.create!(conversation_params)
        end
        render json: @conversation
    end

    private 

    def conversation_params 
        params.permit(:sender_id,:recipient_id)
    end

end
