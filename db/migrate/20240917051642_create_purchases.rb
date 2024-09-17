class CreatePurchases < ActiveRecord::Migration[7.2]
  def change
    create_table :purchases do |t|
      t.references :user_id, null: false, foreign_key: true
      t.datetime :purchase_at

      t.timestamps
    end
  end
end
