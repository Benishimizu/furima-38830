class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_signed_in, expect: [:index]


    def index
      @item = Item.all
      if current_user == @item.user
        redirect_to root_path
        end
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

# end

# =====================
# class PurchasesController < ApplicationController
#   before_action :move_to_signed_in, expect: [:index]

#   def index
#     @donation = Donation.new
#     @item = Item.find(params[:item_id])
#   end

#   def new
#     @donation = Donation.new
#     @item = Item.find(params[:item_id])
#   end  

#   def create
#     @item = Item.find(params[:item_id])
#     @donation = Donation.new(purchase_params)
#     if @donation.save
#       redirect_to root_path
#     else
#       render :new
#     end


#   end

#   private

#   def purchase_params
#     params.require(:donation).permit(:post_code, :city, :block_number, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
#   end  

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end