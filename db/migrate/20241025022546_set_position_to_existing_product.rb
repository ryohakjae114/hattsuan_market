class SetPositionToExistingProduct < ActiveRecord::Migration[7.2]
  def change
    Product.order(:updated_at).each.with_index(1) do |product, index|
      product.update(position: index)
    end
  end
end
