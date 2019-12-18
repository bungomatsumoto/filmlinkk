class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :conversation, foreign_key: true
      t.references :client, foreign_key: true
      t.references :right_holder, foreign_key: true

      t.timestamps
    end
  end
end
