class Address < ApplicationRecord
  belongs_to :orders
  # アソシエーション
end
