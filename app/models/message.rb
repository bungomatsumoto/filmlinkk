class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :client
  belongs_to :right_holder

  validates_presence_of :body, :client_id, :right_holder_id, :conversation_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

end
