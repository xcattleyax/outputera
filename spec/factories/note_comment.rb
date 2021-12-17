FactoryBot.define do
  factory :note_comment do
    comment { Faker::Lorem.sentence }
    status_id { 1 }
  end
end
