FactoryBot.define do
  factory :opinion do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
  end
end
