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
  has_one :order
  # 各モデルとのアソシエーション

  validates :image, presence: { message: 'を選択してください' }
  # 画像未選択では保存できない

  validates :name, :description, :category, :condition, :delivery_charge, :prefecture, :shipping_days, :price, presence: true
  # 空の投稿を保存できない

  validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1, message: 'の項目が未選択です' }
  # 選択が1の「--」の時は保存できない

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300〜9,999,999の間で入力してください' }
  # 入力可能最小値、最大値設定
  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  # 半角数値のみ許可
end
