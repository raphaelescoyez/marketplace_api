module Types
  class CartType < Types::BaseObject
    description "Cart"

    field :id, ID, null: false
    field :total_price, Types::PriceType, null: false
    field :carts_products, [Types::CartsProductType], null: true,
      description: "Products in cart"
  end
end
