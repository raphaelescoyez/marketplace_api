class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.monetize :total_price
      t.timestamps
    end

    create_join_table :orders, :products do |t|
      t.index :product_id
      t.index :order_id
      t.integer :quantity, null: false, default: 1
      t.monetize :product_price
      t.timestamps
    end
  end
end
