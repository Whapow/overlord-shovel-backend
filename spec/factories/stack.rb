FactoryBot.define do
  factory :stack do
    association :inventory
    association :item

    quantity { rand(10..99) }
    position { nil }
  end
end
