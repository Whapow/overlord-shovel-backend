FactoryBot.define do
  factory :user do
    first_name { "Lorem" }
    last_name  { "Ipsum" }
    username { "Dolorsitamet" }
    email { "lorem./ipsum@overlord-shovel.test" }
  end
end