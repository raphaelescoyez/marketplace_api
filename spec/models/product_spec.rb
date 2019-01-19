# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :string
#  inventory_count :integer
#  price_cents     :integer          default(0), not null
#  price_currency  :string           default("USD"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product_a) { FactoryBot.create(:product, inventory_count: 1) }
  let!(:product_b) { FactoryBot.create(:product, inventory_count: 0) }

  describe 'available scope' do
    it 'returns only products with inventory_count greater than 0' do
      expect(Product.available).to match_array [product_a]
    end
  end

  describe 'out_of_stock scope' do
    it 'returns only products with inventory_count less than 1' do
      expect(Product.out_of_stock).to match_array [product_b]
    end
  end
end
