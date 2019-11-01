class RemoveNumberOfDogsFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :number_of_dogs
  end
end
