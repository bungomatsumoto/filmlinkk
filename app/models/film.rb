class Film < ApplicationRecord
  has_many :bookings
  belongs_to :right_holder
end
