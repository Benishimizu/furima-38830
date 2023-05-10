class OrdersController < ApplicationController

  before_action :authenticate_user!, except: :index
# orders#indexで購入のためのフォームを表示し、orders#createで購入の記録をテーブルに保存するようにします。

# また、この購入機能は、商品情報にネストされることに気をつけましょう。パスは以下のように商品のidの後に購入についての処理が存在するようにします。




def index
    @sender == OrderSender.new
  end

  def new
  end

  def create
    @donation_address = OrderSender.new(donation_params)
    if @donation_address.valid?
      @donation_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end


end
