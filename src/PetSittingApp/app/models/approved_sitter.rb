class ApprovedSitter < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  # with dependant destroy means that when removing an approved sitter, all the associated bookings will also be deleted. 
  has_many :bookings, dependent: :destroy

end