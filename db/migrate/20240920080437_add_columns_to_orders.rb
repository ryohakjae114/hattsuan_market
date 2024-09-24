class AddColumnsToOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :Orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :delivery_on, null: false, default: -> { 'CURRENT_DATE' }
      t.string :delivery_time_zone, null: false, default: '', limit: 20
      t.string :delivery_address, null: false, default: '', limit: 200
      t.string :addressee_name, null: false, default: '', limit: 50

      t.timestamps
    end
  end
end
