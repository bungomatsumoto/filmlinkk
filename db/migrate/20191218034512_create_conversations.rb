class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :client, foreign_key: true
      t.references :right_holder, foreign_key: true

      t.timestamps
    end
  end
end
