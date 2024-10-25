class Admins::ProductsController < Admins::AdminController
  before_action :set_product, only: %i[update]

  def index
    @products = Product.order(:position).page(params[:page]).per(50)
  end

  def update
    @product.update!(product_params)
    redirect_to admins_root_path, notice: '並び順を変更しました', status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:position)
  end
end
