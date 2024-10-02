class AddDeliveryFeeToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :delivery_fee, :integer, null: false, default: 0
  end
end
