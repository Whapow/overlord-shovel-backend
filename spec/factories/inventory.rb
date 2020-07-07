FactoryBot.define do
  factory :inventory do
    for_campaign

    trait :for_campaign do
      association :owner, factory: :campaign
    end
    
    trait :for_character do
      association :owner, factory: :character
    end

  end
end
