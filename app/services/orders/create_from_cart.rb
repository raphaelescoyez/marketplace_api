module Orders
  class CreateFromCart

    def initialize(args)
      @cart = Cart.find(args[:cart_id])
      @order = Order.new(email: args[:email])
    end

    def call
      if products_available?
        add_products_to_order
        compute_total_price
        if order.save
          update_inventory
        end
      end
      order
    end

    attr_accessor :cart, :order

    private

    def products_available?
      cart.carts_products.each do |cart_product|
        if cart_product.product.inventory_count < cart_product.quantity
          order.errors.add(:base, "Product #{cart_product.product.title} is currently out of stock")
          return false
        end
        true
      end
    end

    def add_products_to_order
      cart.carts_products.each do |cart_product|
        order.orders_products.build(
          product_id: cart_product.product_id,
          quantity: cart_product.quantity,
          product_price_cents: cart_product.product.price_cents,
          product_price_currency: cart_product.product.price_currency
        )
      end
    end

    def update_inventory
      order.orders_products.each do |orders_product|
        orders_product.product.decrement!(:inventory_count, orders_product.quantity)
      end
    end

    def compute_total_price
      order.total_price_cents = order.orders_products.map(&:total_price_cents).reduce(:+)
    end
  end
end
