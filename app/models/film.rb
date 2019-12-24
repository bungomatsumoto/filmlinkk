class Film < ApplicationRecord
  has_many :clients
  has_many :bookings, dependent: :destroy
  has_many :booking_clients, through: :bookings, source: :client
  belongs_to :right_holder, optional: true

  validates :title, presence: true
  validates :intro, length: { maximum: 500 }
  validates :production_year, numericality: { only_integer: true }

  mount_uploader :image, ImageUploader
  paginates_per 30
end
