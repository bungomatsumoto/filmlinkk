class Conversation < ApplicationRecord
  belongs_to :client
  belongs_to :right_holder

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :client_id, scope: :rright_holder_id

end
