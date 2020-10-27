class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :name, :description, :category, :condition, :delivery_charge, :prefecture, :shipping_days, :price, presence: true

  #選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :delivery_cfarge_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1 } 
  
  # 値段は半角数字のみ許可
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
end
