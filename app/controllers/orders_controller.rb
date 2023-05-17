class OrdersController < ApplicationController

  before_action :authenticate_user!, except: :index


def index
    @item = Item.find(params[:item_id])
    @order_sender = OrderSender.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order_sender = OrderSender.new(sender_params)
    if @order_sender.valid?
      pay_item
      @order_sender.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sender_params
    params.require(:order_sender).permit(:postal_code, :prefecture_id, :city, :detailed_address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: sender_params[:token],   
      currency: 'jpy'             
    )
  end


end
