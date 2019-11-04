class RemoveTimeFinishesFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :time_finishes, :time
  end
end
