FactoryBot.define do
  factory :follower do
    follow_id { Faker::Number.digit }
  end
end
