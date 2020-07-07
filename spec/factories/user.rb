FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end