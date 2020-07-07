FactoryBot.define do
  factory :campaign do
    name { "Deurova" }
    user { User.first }
  end
end