FactoryBot.define do
  factory :note_answer do
    content { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
  end
end
