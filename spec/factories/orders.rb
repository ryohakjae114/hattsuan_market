FactoryBot.define do
  factory :order do
    user { nil }
    delivery_on { '2024-09-20' }
    delivery_time_zone { '08-12' }
    delivery_address { 'MyString' }
    addressee_name { 'MyString' }
  end
end
