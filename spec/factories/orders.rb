FactoryBot.define do
  factory :order do
    user { nil }
    delivery_on { 3.business_days.from_now.to_date }
    delivery_time_zone { '08-12' }
    delivery_address { 'MyString' }
    addressee_name { 'MyString' }
  end
end
