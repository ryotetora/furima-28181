class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name, :user_id, :item_id, :order_id
  # 保存したいモデルのカラムを許可



# ここにバリデーション


  def save
    # user,item,order情報を保存し、変数に入れ、他モデルの保存で使用
      user = OrderAddress.create(user_id: user_id)
      item = OrderAddress.create(item_id: item_id)
      order = OrderAddress.create(order_id: order_id)

    # 住所情報を保存
    Address.create(
      post_code:   post_code,
      prefecture_id:    prefecture_id, 
      city:          city, 
      house_number:  house_number,
      building_name: building_name,
      phone_number:  phone_number,
      order_id:      order.id
      )

    # 購入情報の保存
    Order.create(
      user_id: user.id,
      item_id: item.id
      )
  end
end