class Owner < ApplicationRecord
  belongs_to :owner_user
  has_many :bookings
end
