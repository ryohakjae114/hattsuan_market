class AddProductToPurchaseItem < ActiveRecord::Migration[7.2]
  def change
    add_reference :purchase_items, :product, null: false, foreign_key: true
  end
end
