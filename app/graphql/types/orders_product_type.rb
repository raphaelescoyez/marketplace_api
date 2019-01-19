module Types
  class OrdersProductType < Types::BaseObject
    description "Product"

    field :id, ID, null: false
    field :product, ProductType, null: false
    field :product_price, Types::PriceType, null: false
    field :quantity, Int, null: false
  end
end
