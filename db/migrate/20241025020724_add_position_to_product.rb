class AddPositionToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :position, :integer
  end
end
