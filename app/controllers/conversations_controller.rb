class ConversationsController < ApplicationController
  before_action :authenticate_filmlinkk!

  def index
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:client_id], params[:right_holder_id]).present?
      @conversation = Conversation.between(params[:client_id], params[:right_holder_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    # @conversationのメッセージ一覧へ
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:client_id, :right_holder_id)
  end

  def authenticate_filmlinkk!
    authenticate_client! || authenticate_right_holder!
  end
end
