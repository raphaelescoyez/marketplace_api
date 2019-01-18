# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe 'total_price' do
    let(:cart) { Cart.create }
    let(:product_a) { FactoryBot.create(:product, price_cents: 1000) }
    let(:product_b) { FactoryBot.create(:product, price_cents: 2000) }

    it 'returns cart total price' do
      CartsProduct.create(cart: cart, product: product_a, quantity: 2)
      CartsProduct.create(cart: cart, product: product_b, quantity: 1)
      expect(cart.total_price).to eq(Money.new(4000, 'EUR'))
    end
  end
end
