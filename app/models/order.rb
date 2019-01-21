# == Schema Information
#
# Table name: orders
#
#  id                   :integer          not null, primary key
#  total_price_cents    :integer          default(0), not null
#  total_price_currency :string           default("USD"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  email                :string
#

class Order < ApplicationRecord
  has_many :orders_products
  has_many :products, through: :orders_products

  validates :total_price_cents, presence: true
  validates :orders_products, presence: true

  monetize :total_price_cents
end
