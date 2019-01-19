# == Schema Information
#
# Table name: orders_products
#
#  id                     :integer          not null, primary key
#  order_id               :integer          not null
#  product_id             :integer          not null
#  quantity               :integer          default(1), not null
#  product_price_cents    :integer          default(0), not null
#  product_price_currency :string           default("USD"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe OrdersProduct, type: :model do

  describe 'total_price_cents' do
    it 'returns quantity * product_price_cents' do
      orders_product = OrdersProduct.new(quantity: 6, product_price_cents: 100)
      expect(orders_product.total_price_cents).to eq 600
    end
  end
end
