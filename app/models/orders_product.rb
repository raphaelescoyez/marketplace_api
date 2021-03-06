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

class OrdersProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  monetize :product_price_cents
  monetize :total_price_cents

  def total_price_cents
    product_price_cents * quantity
  end
end
