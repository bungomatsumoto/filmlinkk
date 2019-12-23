class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :films
  has_many :bookings, dependent: :destroy
  has_many :booking_films, through: :bookings, source: :film

  validates :name, presence: true, uniqueness: true
  validates :email, length: { maximum: 50 }
  
  mount_uploader :icon, ImageUploader
end
