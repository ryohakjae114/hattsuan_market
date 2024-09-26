class AddPriceWithTaxToOrderItems < ActiveRecord::Migration[7.2]
  def change
    add_column :order_items, :price_with_tax, :integer, null: false, default: 0
  end
end
