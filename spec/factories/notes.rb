FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id { Faker::Number.between(from: 2, to: 6) }
  end
end
