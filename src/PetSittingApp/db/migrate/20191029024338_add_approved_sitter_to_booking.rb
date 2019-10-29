class AddApprovedSitterToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :approved_sitter, foreign_key: true
  end
end
