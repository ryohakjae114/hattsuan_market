class DeleteProductFromPriceWithoutTax < ActiveRecord::Migration[7.2]
  def change
    remove_column :cart_items, :price_without_tax, :integer
  end
end
