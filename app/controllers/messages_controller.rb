class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  before_action :authenticate_filmlinkk!


  def index
    @messages = @conversation.messages.order(:created_at)
    @message = @conversation.messages.build
    # @conversation
  end

  def create
    @message = @conversation.messages.build(message_params)
    # binding.pry
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
    current_client.nil? ? authenticate_right_holder! : authenticate_client!
  end
end
