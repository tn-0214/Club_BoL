FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    last_name {"山田"}
    first_name {"太郎"}
    email {Faker::Internet.free_email}
    password = "abc123"
    password {password}
    password_confirmation {password}
    birthday {Faker::Date.backward}
    phone_number {"09000000000"}
    postcode {"2390808"}
    prefecture_code {"14"}
    address_city {"横須賀市"}
  end
end
