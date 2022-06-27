class MessagesController < ApplicationController
    before_action :find_convo 

    def index
        @messages = @converation.messages
    end

    def create 
        @conversations.messages.create!(message_params)
    end



    private

    def find_convo
        @conversation = Conversation.find(params[conversation_id])
    end

    def message_params
        params.require(:message).permit(:body, :user_id)
    end

end
