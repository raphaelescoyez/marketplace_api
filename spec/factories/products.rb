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

FactoryBot.define do
  factory :product do
    title             { Faker::Appliance.equipment }
    description       { "#{Faker::Appliance.brand} - #{Faker::Lorem.sentence}" }
    price_cents       { Faker::Number.between(50_000, 10_000) }
    inventory_count   { Faker::Number.between(0, 10) }
  end
end
