class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :bookings, dependent: :destroy
  has_many :booking_films, through: :bookings, source: :film
  mount_uploader :icon, ImageUploader
end
