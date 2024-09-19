class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def price_with_tax
    product.price_with_tax * quantity
  end
end
