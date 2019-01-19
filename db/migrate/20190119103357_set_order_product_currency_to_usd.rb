class SetOrderProductCurrencyToUsd < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders_products, :product_price_currency, "USD"
  end
end
