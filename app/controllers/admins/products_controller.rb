class Admins::ProductsController < AdminController
  def index
    @products = Product.order(:created_at).page(params[:page]).per(50)
  end
end
