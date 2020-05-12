FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "group_#{n}" }
    description { Faker::Lorem.sentence(word_count: 5) }
  end
end
