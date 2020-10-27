class ItemsController < ApplicationController
  # ログインしていないと出品はできない
  before_action :authenticate_user!, only:[:create,:new]

  def index
  end

  def create
    @item = Item.new(item_params)
    # if @item.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end


  def new
    @item = Item.new
  end

  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_cfarge_id, :prefecture_id, :shipping_days_id)
  end
  # これあってるか自信薄

end
