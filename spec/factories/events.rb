FactoryBot.define do
  factory :event do
    name { Faker::Lorem.sentence(word_count: 3) }
    location { Faker::Address.full_address }
    date { Faker::Date.forward(days: 30) }
    price { Faker::Commerce.price(range: 0..100.0) }
    capacity { Faker::Number.between(from: 10, to: 100) }
  end
end