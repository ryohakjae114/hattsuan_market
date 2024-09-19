class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show]

  def index
    @products = Product.cart(:created_at).page(params[:page]).per(12)
  end

  def show
    @cart_item = OrderItem.new(product_id: @product.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
