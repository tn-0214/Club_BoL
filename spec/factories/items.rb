FactoryBot.define do
  factory :item do
    name {Faker::Name.initials(number: 2)}
    comment {Faker::Lorem.sentence}
    precaution {Faker::Lorem.sentence}
    gender_id {2}
    due_date {2021-05-31}
    minimum_period {2}
    daily_price {400}
    category_ids {[2,4]}
    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image/test_image.png'), filename: 'test_image.png')
    end
  end
end
