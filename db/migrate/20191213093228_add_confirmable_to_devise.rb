class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_column :clients, :confirmation_token, :string
    add_column :clients, :confirmed_at, :datetime
    add_column :clients, :confirmation_sent_at, :datetime
    add_column :clients, :unconfirmed_email, :string
    add_index :clients, :confirmation_token, unique: true

    add_column :right_holders, :confirmation_token, :string
    add_column :right_holders, :confirmed_at, :datetime
    add_column :right_holders, :confirmation_sent_at, :datetime
    add_column :right_holders, :unconfirmed_email, :string
    add_index :right_holders, :confirmation_token, unique: true

    execute("UPDATE clients SET confirmed_at = NOW()")
    execute("UPDATE right_holders SET confirmed_at = NOW()")
  end

  def down
    remove_columns :clients, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :clients, :unconfirmed_email

    remove_columns :right_holders, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :right_holders, :unconfirmed_email
  end
end
