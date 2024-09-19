class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: [:show]

  def index
    @products = Product.order(:created_at).page(params[:page]).per(12)
  end

  def show
    @cart_item = current_cart.cart_items.find_or_initialize_by(product_id: @product.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
