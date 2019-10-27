FactoryBot.define do
  factory :item do
    name  { Faker::Commerce.product_name }
    consumable {true}
  end
end
