class AddProductToCartItem < ActiveRecord::Migration[7.2]
  def change
    add_reference :cart_items, :product, null: false, foreign_key: true # rubocop:disable Rails/NotNullColumn
  end
end
