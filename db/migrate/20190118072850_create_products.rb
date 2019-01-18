class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :inventory_count
      t.monetize :price
      t.timestamps
    end
  end
end
