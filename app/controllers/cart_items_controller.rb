class CartItemsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items
  end

  def create
    current_cart.cart_items.create!(cart_item_params)
    redirect_to root_url, notice: t('controller.created')
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
