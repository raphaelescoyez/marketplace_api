module Types
  class CartsProductType < Types::BaseObject
    description "Product"

    field :id, ID, null: false
    field :product, ProductType, null: false
    field :quantity, Int, null: false
  end
end
