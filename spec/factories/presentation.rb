FactoryBot.define do
  factory :presentation do
    title { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 6) }
    detail_id { Faker::Number.between(from: 1, to: 2) }
  end
end
