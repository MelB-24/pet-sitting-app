class RemoveSitterFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :sitter, foreign_key: true
  end
end
