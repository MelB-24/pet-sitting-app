class ApprovedSitter < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  has_many :bookings, dependent: :destroy
end