# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :string
#  inventory_count :integer
#  price_cents     :integer          default(0), not null
#  price_currency  :string           default("EUR"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Product < ApplicationRecord
  monetize :price_cents
end
