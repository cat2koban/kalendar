FactoryBot.define do
  factory :task do
    title       { Faker::Lorem.sentence(word_count: 2) }
    description { Faker::Lorem.sentence(word_count: 10) }
    user        { create(:user) }
    start_at    { Time.now }
    finish_at   { Time.now }
  end
end
