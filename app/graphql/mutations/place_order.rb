module Mutations
  class PlaceOrder < Mutations::Base
    null true

    argument :cart_id, ID, required: true
    argument :email, String, required: true

    field :order, Types::OrderType, null: true
    field :errors, [String], null: false

    def resolve(**args)
      order = Orders::CreateFromCart.new(args).call
      if order.persisted?
        {
          order: order,
          errors: [],
        }
      else
        {
          order: nil,
          errors: order.errors.full_messages
        }
      end
    end
  end
end
