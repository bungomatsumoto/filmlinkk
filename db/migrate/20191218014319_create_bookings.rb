class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :client, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
