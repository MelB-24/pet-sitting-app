class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :date_of_birth
      t.integer :microchip_number
      t.text :bio
      t.integer :sex
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
