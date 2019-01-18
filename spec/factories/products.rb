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

FactoryBot.define do
  factory :product do
    title             { Faker::Device.model_name}
    description       { "#{Faker::Device.manufacturer} - #{Faker::Lorem.sentence}" }
    price_cents       { Faker::Number.number(5) }
    inventory_count   { Faker::Number.number(2) }
  end
end
