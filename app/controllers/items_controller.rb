class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

    def index
      @items = Item.order("created_at DESC")
    end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  
  end

  def show

  end

  def edit
    unless current_user == @item.user && @item.order == nil
      redirect_to root_path
    end

# 購入履歴
# edit画面に飛んで欲しくないのは　ログインと出品者が別
# もしくは商品が売れていたら
# 後ほど上記は確認する必要あり

  end

  def update
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
      
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:price, :description, :item_category_id, :item_description_id, :prefecture_id, :shipping_fee_id, :image, :shipping_term_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

