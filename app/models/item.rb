class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days
  # activehashアソシエーション

  has_one_attached :image
  # activestorageアソシエーション

  belongs_to :user
  has_one :orders
  # 各モデルとのアソシエーション

  validates :image, :name, :description, :category, :condition, :delivery_charge, :prefecture, :shipping_days, :price, presence: true
  # 空の投稿を保存できない

  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1, message: '項目が未選択です' }
  # 選択が1の「--」の時は保存できない

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  # 入力可能最小値、最大値設定
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  # 半角数値のみ許可
end
