FactoryBot.define do
  factory :spot do
    name { 'MyString' }
    address { 'MyString' }
    latitude { 1.5 }
    longitude { 1.5 }
    user { nil }
  end
end
