class Conversation < ApplicationRecord
  belongs_to :client
  belongs_to :right_holder
  has_many :messages, dependent: :destroy

  scope :between, -> (right_holder_id, client_id) do
    where(["(conversations.client_id = ? AND conversations.right_holder_id = ?) OR (conversations.client_id = ? AND conversations.right_holder_id = ?)", client_id, right_holder_id, right_holder_id, client_id])
  end

  # validates_uniqueness_of :client_id, scope: :right_holder_id

end
