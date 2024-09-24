class OrdersController < ApplicationController
  def new
    @order = current_user.orders.build
  end
end
