class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  # ログインしていないと出品はできない

  def index
    @items = Item.all.order('created_at DESC')
    #  全レコード情報をもつインスタンス変数を生成、並びを降順指定
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      # 保存に成功すればrootにとばす
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:image, :user, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_days_id, :price).merge(user_id: current_user.id)
    # ストロングパラメータで出品者、商品情報を取得
  end
end
