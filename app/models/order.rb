class Order < ApplicationRecord
  belongs_to :users
  belongs_to :items
  has_one :address
  # 各モデルとのアソシエーション
end
