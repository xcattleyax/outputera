FactoryBot.define do
  factory :note_comment do
    comment { Faker::Lorem.sentence }
  end
end
