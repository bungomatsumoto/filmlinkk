class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  before_action :authenticate_filmlinkk!


  def index
    @messages = @conversation.messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :right_holder_id, :client_id)
  end

  def authenticate_filmlinkk!
    authenticate_client! || authenticate_right_holder!
  end
end
