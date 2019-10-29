class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time_starts
      t.time :time_finishes
      t.integer :number_of_dogs
      t.references :owner, foreign_key: true
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
