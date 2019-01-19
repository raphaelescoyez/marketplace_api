# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :carts_products
  has_many :products, through: :carts_products

  monetize :total_price_cents

  def total_price_cents
    carts_products.any? ? carts_products.map(&:price_cents).reduce(:+) : 0
  end

  def add_to_cart(product_id)
    cart_product = carts_products.find_by(product_id: product_id)
    if cart_product.present?
      cart_product.increment!(:quantity, 1)
    else
      carts_products.create(product_id: product_id)
    end
  end

  def remove_from_cart(product_id)
    cart_product = carts_products.find_by(product_id: product_id)
    return if cart_product.blank?
    if cart_product.quantity > 1
      cart_product.decrement!(:quantity, 1)
    else
      carts_products.destroy
    end
  end
end
