class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :user_id, :item_id
  # 保存したいモデルのカラムを許可


# ここにバリデーションorder,addressのはまだ
# with_options presence: true do
#   validates :nickname
#   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '漢字・ひらがな・カタカナを使用して下さい' }
#   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '漢字・ひらがな・カタカナを使用して下さい' }
#   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用して下さい' }
#   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用して下さい' }
#   validates :birthday
# end

# validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を使用して下さい' }
# validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を使用してください' }

  def save
    # order情報を保存し、変数に入れ、addressモデルの保存で使用
      order = Order.create(user_id: user_id,item_id: item_id)
      
    # 住所情報を保存
    Address.create(
      post_code:     post_code,
      prefecture_id: prefecture_id, 
      city:          city, 
      house_number:  house_number,
      building_name: building_name,
      phone_number:  phone_number,
      order_id:      order.id
      )
  end
end