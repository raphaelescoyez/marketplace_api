module Types
  class OrderType < Types::BaseObject
    description "Order"

    field :id, ID, null: false
    field :total_price, Types::PriceType, null: false
    field :orders_products, [Types::OrdersProductType], null: true,
      description: "Products in cart"
  end
end
