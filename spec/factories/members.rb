FactoryBot.define do
  factory :member do
    user { create(:user) }
    group { create(:group) }
  end
end
