class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.order(:created_at).page(params[:page]).per(12)
  end

  def show
    @purchase_item = PurchaseItem.new(product_id: @product.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
