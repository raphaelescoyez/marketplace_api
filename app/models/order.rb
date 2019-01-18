# == Schema Information
#
# Table name: orders
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  total_price_cents    :integer          default(0), not null
#  total_price_currency :string           default("EUR"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Order < ApplicationRecord
  has_many :orders_products
  has_many :products, through: :orders_products
  belongs_to :user
end
