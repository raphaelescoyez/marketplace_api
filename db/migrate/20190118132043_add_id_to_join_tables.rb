class AddIdToJoinTables < ActiveRecord::Migration[5.2]
  def change
    add_column :carts_products, :id, :primary_key
    add_column :orders_products, :id, :primary_key
  end
end
