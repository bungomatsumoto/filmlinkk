class RightHolder < ApplicationRecord
  has_many :films
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true
  validates :email, length: { maximum: 50 }
  validates :intro, length: { maximum: 500 }

  mount_uploader :icon, ImageUploader
end
