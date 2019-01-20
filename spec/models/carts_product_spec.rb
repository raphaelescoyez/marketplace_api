# == Schema Information
#
# Table name: carts_products
#
#  id         :integer          not null, primary key
#  cart_id    :integer          not null
#  product_id :integer          not null
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CartsProduct, type: :model do

  describe 'price_cents' do
    let(:product) { FactoryBot.create(:product, price_cents: 100, inventory_count: 10) }

    it 'returns quantity * product_price_cents' do
      carts_product = CartsProduct.new(product: product, quantity: 6)
      expect(carts_product.price_cents).to eq 600
    end
  end
end
