class ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at).page(params[:page]).per(12)
  end
end
