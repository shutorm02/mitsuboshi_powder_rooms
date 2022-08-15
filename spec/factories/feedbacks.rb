FactoryBot.define do
  factory :feedback do
    star { 1 }
    feedback_comment { 'MyString' }
    user { nil }
    spot { nil }
  end
end
