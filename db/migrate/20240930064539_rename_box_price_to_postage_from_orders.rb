class RenameBoxPriceToPostageFromOrders < ActiveRecord::Migration[7.2]
  def change
    rename_column :orders, :postage, :postage
  end
end
