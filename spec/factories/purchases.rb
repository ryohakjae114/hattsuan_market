FactoryBot.define do
  factory :purchase do
    purchase { nil }
    user { nil }
    delivery_on { "2024-09-20" }
    delivery_time_zome { "MyString" }
    delivery_address { "MyString" }
    addressee_name { "MyString" }
  end
end
