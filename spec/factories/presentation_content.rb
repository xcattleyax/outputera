FactoryBot.define do
  factory :presentation_content do
    page { Faker::Number.digit }
    content { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
  end
end
