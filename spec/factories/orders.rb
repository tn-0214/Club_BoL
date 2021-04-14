FactoryBot.define do
  factory :order do
    lending_period {10}
    association :user
    association :item
  end
end
