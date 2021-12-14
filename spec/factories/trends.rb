FactoryBot.define do
  factory :trend do
    category_id { Faker::Number.between(from: 2, to: 6) }
  end
end
