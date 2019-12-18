class AddIndexToConversations < ActiveRecord::Migration[5.2]
  def change
    add_index :conversations, [:client_id, :right_holder_id], unique: true
  end
end
