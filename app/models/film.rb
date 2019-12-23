class Film < ApplicationRecord
  has_many :clients
  has_many :bookings, dependent: :destroy
  has_many :booking_clients, through: :bookings, source: :client
  belongs_to :right_holder, optional: true
  mount_uploader :image, ImageUploader
end
