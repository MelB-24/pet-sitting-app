class RemoveOwnerFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :owner, foreign_key: true
  end
end
