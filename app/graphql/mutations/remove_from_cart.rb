module Mutations
  class RemoveFromCart < Mutations::Base
    null true

    argument :cart_id, ID, required: true
    argument :product_id, ID, required: true

    field :cart, Types::CartType, null: true
    field :errors, [String], null: false

    def resolve(**args)
      cart = Cart.find(args[:cart_id])
      cart.remove_from_cart(args[:product_id])
      if cart.save
        {
          cart: cart,
          errors: [],
        }
      else
        {
          cart: nil,
          errors: cart.errors.full_messages
        }
      end
    end
  end
end
