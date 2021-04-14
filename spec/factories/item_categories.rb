FactoryBot.define do
  factory :item_category do
    association :item
    association :category
    category_ids {[2,4]}
  end
end
