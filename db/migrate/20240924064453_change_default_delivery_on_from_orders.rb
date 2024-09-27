class ChangeDefaultDeliveryOnFromOrders < ActiveRecord::Migration[7.2]
  def change
    change_column_default :orders, :delivery_on, from: 'CURRENT_DATE', to: ''
  end
end
