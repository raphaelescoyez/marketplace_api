module Types
  class QueryType < Types::BaseObject

    field :product, ProductType, null: false do
      description "Find a product by ID"
      argument :id, ID, required: true
    end

    def product(id:)
      Product.find(id)
    end

    field :products, [ProductType], null: false do
      description "Get list of all products"
      argument :available_only, Boolean, required: false
    end

    def products(available_only: false)
      if available_only
        Product.available
      else
        Product.all
      end
    end

    field :cart, CartType, null: false do
      description "Find a cart by ID"
      argument :id, ID, required: true
    end

    def cart(id:)
      Cart.find(id)
    end

    field :order, OrderType, null: false do
      description "Find an order by ID"
      argument :id, ID, required: true
    end

    def order(id:)
      Order.find(id)
    end
  end
end
