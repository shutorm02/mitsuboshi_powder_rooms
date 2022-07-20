FactoryBot.define do
  factory :spot do
    sequence(:name) { |n| "〇〇駅#{n}番ホーム"}
    sequence(:address) { |n| "東京都文京区#{n}" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :user
  end
end
