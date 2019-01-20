# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.create }

  describe 'total_price' do
    let(:product_a) { FactoryBot.create(:product, price_cents: 1000, inventory_count: 10) }
    let(:product_b) { FactoryBot.create(:product, price_cents: 2000, inventory_count: 10) }

    it 'returns cart total price' do
      CartsProduct.create(cart: cart, product: product_a, quantity: 2)
      CartsProduct.create(cart: cart, product: product_b, quantity: 1)
      expect(cart.total_price).to eq(Money.new(4000, 'USD'))
    end
  end

  describe 'add_to_cart(product_id)' do
    let(:product) { FactoryBot.create(:product, price_cents: 1000) }

    context 'when product is already in the cart' do
      let!(:carts_product) { CartsProduct.create(cart: cart, product: product) }

      it 'increase carts_product quantity by 1' do
        expect {
          cart.add_to_cart(product.id)
        }.to change { carts_product.reload.quantity }.by 1
      end
    end

    context 'when product is not in the cart yet' do

      it 'creates a new carts_product record' do
        expect {
          cart.add_to_cart(product.id)
        }.to change { cart.carts_products.count }.by 1
      end
    end
  end

  describe 'remove_from_cart(product_id)' do
    let!(:product) { FactoryBot.create(:product, price_cents: 1000) }

    context 'when several items of this product are in the cart' do
      let(:carts_product) { CartsProduct.create(cart: cart, product: product, quantity: 2) }

      it 'decreases carts_product quantity by 1' do
        expect {
          cart.remove_from_cart(product.id)
        }.to change { carts_product.reload.quantity }.by -1
      end
    end

    context 'when only 1 item of this product is in the cart yet' do
      let!(:carts_product) { CartsProduct.create(cart: cart, product: product, quantity: 1) }

      it 'deletes carts_product record' do
        expect {
          cart.remove_from_cart(product.id)
        }.to change { cart.reload.carts_products.count }.by -1
      end
    end
  end
end
