FactoryBot.define do
  factory :user do
    name                  { 'text' }
    email                 { 'test@example.com' }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end
