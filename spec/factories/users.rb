FactoryBot.define do
  factory :user do
    email { 'sample@example.com' }
    password { '123456123456' }
    password_confirmation { '123456123456' }
  end
end
