module Types
  class ProductType < Types::BaseObject
    description "Product"

    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :price, Types::PriceType, null: false
    field :inventory_count, Int, null: false
  end
end
