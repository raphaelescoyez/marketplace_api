module Types
  class OrderType < Types::BaseObject
    description "Order"

    field :total_price_cents, Int, null: false
    field :total_price_currency, String, null: false
    field :orders_products, [Types::OrdersProductType], null: true,
      description: "Products in cart"
  end
end
