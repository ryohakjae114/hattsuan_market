class AddPriceWithTaxToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :price_with_tax, :integer, null: false, default: 0
  end
end
