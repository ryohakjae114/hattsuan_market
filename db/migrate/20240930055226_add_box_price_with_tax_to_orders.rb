class AddBoxPriceWithTaxToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :postage, :integer, null: false, default: 0
  end
end
