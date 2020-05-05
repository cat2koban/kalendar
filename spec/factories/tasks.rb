FactoryBot.define do
  factory :task do
    title       { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.sentence(word_count: 10) }
    association :user, factory: :user
  end
end
