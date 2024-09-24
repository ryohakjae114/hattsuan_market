class Cart::CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update]
  def create
    current_cart.cart_items.create!(cart_item_params)
    redirect_to root_url, notice: t('controller.created')
  end

  def update
    @cart_item.update!(cart_item_params)
    redirect_to product_path(@cart_item.product), notice: t('controller.updated'), status: :see_other
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
