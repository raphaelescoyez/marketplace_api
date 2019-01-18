class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.timestamps
    end

    create_join_table :carts, :products do |t|
      t.index :product_id
      t.index :cart_id
      t.integer :quantity, null: false, default: 1
      t.timestamps
    end
  end
end
