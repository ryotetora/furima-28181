class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # ログインしていないと購入はできない
  before_action :sold_out_item, only: [:index]
  # 購入済み商品の購入ページへはいけない
  before_action :seller_of_item_return, only: [:index, :create]
  # 出品者は自身の商品の購入ページへ行けない
  before_action :set_item, only: [:index, :create]
  # 定義したitem_idをインスタンス変数に
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to items_path
      #  購入できたらTOPにとばす
    else
      render :index
      #  購入できなければ冒頭にとばす
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    # order_addressで許可したカラムと同様、入力されてこない情報はmergeして取得
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵、環境変数
    Payjp::Charge.create(
      amount: @item[:price],       # 商品の値段
      card: order_params[:token],  # トークン
      currency: 'jpy'              # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
      #  購入済み商品の購入ページへ行こうとするとTOPにとばす
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
    # 同じ記述をまとめるメソッド、定義したitem_idをインスタンス変数に
  end

  def seller_of_item_return
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
      # 出品者は自身の商品の購入ページへ行けない
    end
  end
end
