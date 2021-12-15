FactoryBot.define do
  factory :diary do
    date {Faker::Date.in_date_period}
    time {Faker::Number.between(from: 1, to: 24)}
    category_id {Faker::Number.between(from: 2, to: 6)}
  end
end