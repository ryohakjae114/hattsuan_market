class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :price_without_tax, null: false, default: 0
      t.integer :quantity, null: false, default: 0

      t.timestamps
    end
  end
end
