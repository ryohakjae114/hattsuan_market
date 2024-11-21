class AddNameAndAddressToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, null: false, default: '', limit: 50 # rubocop:disable Rails/BulkChangeTable
    add_column :users, :address, :string, null: false, default: '', limit: 200
  end
end
