class Owner < ApplicationRecord
  belongs_to :owner_user
  has_many :approved_sitters
  has_many :dogs
  has_many :bookings, through: :approved_sitters
end
