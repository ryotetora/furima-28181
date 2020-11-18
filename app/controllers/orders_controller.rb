class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # 一度item_idを定義しないと使用できなかったので定義
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
       @order_address.save
       redirect_to action: :index
    else
       render action: :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(user_id: current_user.id,item_id: @item.id)
# order_addressで許可したカラムと同様
  end



end