class RemoveTimeStartsFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :time_starts, :time
  end
end
