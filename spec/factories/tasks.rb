FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    start_at { "MyString" }
    finish_at { "MyString" }
    user { nil }
  end
end
