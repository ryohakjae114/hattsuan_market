class PurchaseItemsController < ApplicationController
  def create
    @purchase = current_user.purchases.find_or_initialize_by(purchase_at: nil)
    @purchase.build(purchase_item_params)
    @purchase.save!
    redirect_to root_url, notice: t('controller.created')
  end

  private

  def purchase_item_params
    params.require(:purchase_item).permit(:product_id, :quantity)
  end
end
