# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :carts_products
  has_many :products, through: :carts_products
  belongs_to :user, optional: true

  monetize :total_price_cents

  def total_price_cents
    carts_products.any? ? carts_products.map(&:price_cents).reduce(:+) : 0
  end
end
