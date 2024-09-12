class Admins::ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at).page(params[:page]).per(50)
  end

  def new
    @product = Product.new
  end

  def create
  end
end
