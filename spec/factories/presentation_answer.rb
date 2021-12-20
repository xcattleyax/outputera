FactoryBot.define do
  factory :presentation_answer do
    content { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
  end
end
