class CreateSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.string :name
      t.string :address
      t.string :suburb
      t.string :state
      t.integer :postcode
      t.string :business_name
      t.integer :price
      t.references :sitter_user, foreign_key: true

      t.timestamps
    end
  end
end
