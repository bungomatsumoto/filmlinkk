class RightHolder < ApplicationRecord
  has_many :films
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  mount_uploader :icon, ImageUploader
end
