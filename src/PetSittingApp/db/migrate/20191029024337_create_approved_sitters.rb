class CreateApprovedSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :approved_sitters do |t|
      t.references :owner, foreign_key: true
      t.references :sitter, foreign_key: true
    end
  end
end
