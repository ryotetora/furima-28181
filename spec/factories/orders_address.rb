FactoryBot.define do
  factory :OrderAddress do
    post_code      { '111-1111' }
    prefecture_id  { 2 }
    city           { '横浜市' }
    house_number   { '青山1-1-1' }
    phone_number   { '09012345678' }
    token          { 'tok_39e15a8b607ed2fae495c119c448' }
  end
end
