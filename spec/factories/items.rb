FactoryBot.define do
  factory :item do
    name                 { 'アイテム' }
    description          { 'test' }
    category_id          { 2 }
    condition_id         { 2 }
    delivery_charge_id   { 2 }
    prefecture_id        { 2 }
    shipping_days_id     { 2 }
    price                { 300 }
    association :user
  end
end
