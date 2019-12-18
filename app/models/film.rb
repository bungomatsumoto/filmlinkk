class Film < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :booking_clients, through: :bookings, source: :client
  belongs_to :right_holder
  mount_uploaders :images, ImageUploader
end
