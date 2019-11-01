class ChangeColumnInDog < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :microchip_number, :bigint
  end
end
