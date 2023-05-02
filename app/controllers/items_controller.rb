class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


    def index
      # @items = Item.all
      # @item = Item.new
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

  private

  def item_params
    params.require(:item).permit(:item_name,:price, :description, :item_category_id, :item_description_id, :prefecture_id, :shipping_fee_id, :image, :shipping_term_id).merge(user_id: current_user.id)
  end

end

