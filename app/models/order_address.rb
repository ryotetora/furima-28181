class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :user_id, :item_id, :token
  # 保存したいモデルのカラムを許可

  with_options presence: true do
    validates :city, :house_number, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    # 郵便番号はハイフン必須
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is too long (maximum is 11 characters)' }
    # 電話番号はハイフン無し11桁以内
    validates :prefecture_id, numericality: { other_than: 1, message: '項目が未選択です' }
    # 選択が1の「--」の時は保存できない
  end
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  # 電話番号は半角数値のみ許可

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # order情報を保存し、変数に入れ、addressモデルの保存で使用

    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
    # 住所情報を保存
  end
end
