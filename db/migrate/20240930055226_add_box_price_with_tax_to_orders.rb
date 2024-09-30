class AddBoxPriceWithTaxToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :box_price, :integer, null: false, default: 0
  end
end
