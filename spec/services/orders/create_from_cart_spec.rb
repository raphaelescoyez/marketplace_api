require 'rails_helper'

describe Orders::CreateFromCart do
  let(:product) { FactoryBot.create(:product, price_cents: 1000, inventory_count: 2) }
  let(:arguments) { { cart_id: cart.id, email: "email@example.com" } }
  let(:cart) { Cart.create }

  describe 'call' do
    context 'if all products are available' do
      before do
        cart.carts_products.create(product: product, quantity: 2)
      end

      it 'creates order' do
        expect {
          Orders::CreateFromCart.new(arguments).call
        }.to change { Order.count }.by 1
      end

      it 'sets total_price to created order' do
        order = Orders::CreateFromCart.new(arguments).call
        expect(order.total_price).to eq Money.new(2000, 'USD')
      end

      it 'creates an orders_product' do
        expect {
          Orders::CreateFromCart.new(arguments).call
        }.to change { OrdersProduct.count }.by 1
      end

      it 'sets product price & quantity to created orders_product' do
        Orders::CreateFromCart.new(arguments).call
        expect(OrdersProduct.last).to have_attributes(
          product_price_cents: 1000,
          quantity: 2
        )
      end

      it 'decrements product inventory_count' do
        expect {
          Orders::CreateFromCart.new(arguments).call
        }.to change { product.reload.inventory_count }.by -2
      end
    end

    context 'if some products are unavailable' do
      before do
        cart.carts_products.create(product: product, quantity: 3)
      end

      it 'does not create order' do
        expect {
          Orders::CreateFromCart.new(arguments).call
        }.not_to change { Order.count }
      end

      it 'returns order with error' do
        order = Orders::CreateFromCart.new(arguments).call
        expect(order.errors.full_messages).to include("Product #{product.title} is currently out of stock")
      end

      it 'does not decrement product inventory_count' do
        expect {
          Orders::CreateFromCart.new(arguments).call
        }.not_to change { product.reload.inventory_count }
      end
    end
  end
end
