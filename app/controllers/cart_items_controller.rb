class CartItemsController < ApplicationController
  def index
    @order_items = current_user.order&.order_items
  end

  def create
    @order = Order.find_or_initialize_by(user_id: current_user.id)
    @order.order_items.build(order_item_params)
    @order.save!
    redirect_to root_url, notice: t('controller.created')
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
