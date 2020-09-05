FactoryBot.define do
  factory :item do
    name { Faker::Dessert.variety }
    value { rand(10000) }
  end
end
