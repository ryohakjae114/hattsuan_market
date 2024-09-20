class AddUniquenessCartItemToProductAndOrder < ActiveRecord::Migration[7.2]
  def change
    add_index :cart_items, %i[product_id cart_id], unique: true
  end
end
