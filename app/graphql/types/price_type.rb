module Types
  class PriceType < Types::BaseScalar
    description "Price in USD"

    def self.coerce_input(input_value, context)
      Money.new(input_value, :usd)
    end

    def self.coerce_result(ruby_value, context)
      ruby_value.format
    end
  end
end
