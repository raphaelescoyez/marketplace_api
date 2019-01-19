# == Schema Information
#
# Table name: carts_products
#
#  cart_id    :integer          not null
#  product_id :integer          not null
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :integer          not null, primary key
#

class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :product_id, uniqueness: { scope: :cart_id,
    message: "Product already in your cart" }

  monetize :price_cents

  def price_cents
    product.price_cents * quantity
  end
end
