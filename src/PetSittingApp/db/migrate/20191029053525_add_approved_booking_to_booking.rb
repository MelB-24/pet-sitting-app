class AddApprovedBookingToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :approved_booking, :boolean
  end
end
