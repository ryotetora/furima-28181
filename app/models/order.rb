class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  # 各モデルとのアソシエーション
end
