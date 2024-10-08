class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to root_path, notice: t('.ordered'), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:delivery_on, :delivery_time_zone, :delivery_address, :addressee_name)
  end
end
