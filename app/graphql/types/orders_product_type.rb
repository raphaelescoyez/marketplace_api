module Types
  class OrdersProductType < Types::BaseObject
    description "Product"

    field :id, ID, null: false
    field :product, ProductType, null: false
    field :product_price_cents, Int, null: false
    field :product_price_currency, String, null: false
    field :quantity, Int, null: false
  end
end
