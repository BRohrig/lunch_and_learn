FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    api_key { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end
