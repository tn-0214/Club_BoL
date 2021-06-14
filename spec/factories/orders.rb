FactoryBot.define do
  factory :order do
    lending_period {10}
    association :user
    association :item
    token {"tok_abcdefghijk00000000000000000"}
  end
end
