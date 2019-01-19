class SetDefaultCurrencyToUsd < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :total_price_currency, "USD"
    change_column_default :orders_products, :product_price_cents, "USD"
    change_column_default :products, :price_currency, "USD"
  end
end
