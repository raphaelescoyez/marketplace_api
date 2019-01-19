class DropUsersTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    remove_column :orders, :user_id, :integer, index: true
    remove_column :carts, :user_id, :integer, index: true

    add_column :orders, :email, :string
  end
end
