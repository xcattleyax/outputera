FactoryBot.define do
  factory :presentation_comment do
    comment { Faker::Lorem.sentence }
  end
end
