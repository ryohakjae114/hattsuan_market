class AddColumnsToOrders < ActiveRecord::Migration[7.2]
  def change
    change_table :orders, bulk: true do |t|
      t.date :delivery_on, null: false, default: -> { 'CURRENT_DATE' }
      t.string :delivery_time_zone, null: false, default: '', limit: 20
      t.string :delivery_address, null: false, default: '', limit: 200
      t.string :addressee_name, null: false, default: '', limit: 50
    end
  end
end
