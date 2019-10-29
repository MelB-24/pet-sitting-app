class Sitter < ApplicationRecord
  belongs_to :sitter_user
  has_many :bookings
end
