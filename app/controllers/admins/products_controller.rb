class Admins::ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at).page(params[:page]).per(50)
  end
end
