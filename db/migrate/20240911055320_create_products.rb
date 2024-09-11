class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 100, null: false, default: ''
      t.integer :price_without_tax, default: 0
      t.string :description, limit: 200, null: false, default: ''

      t.timestamps
    end
  end
end
