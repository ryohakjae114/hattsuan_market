class Admins::ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at)
  end
end
