module Mutations
  class AddToCart < Mutations::Base
    null true

    argument :cart_id, ID, required: false
    argument :product_id, ID, required: true

    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve(**args)
      cart = Cart.find_or_create_by(id: args[:cart_id])
      carts_product = cart.add_to_cart(args[:product_id])
      {
        cart: cart,
        errors: carts_product.errors.full_messages
      }
    end
  end
end
