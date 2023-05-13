class OrdersController < ApplicationController

  before_action :authenticate_user!, except: :index
# orders#indexで購入のためのフォームを表示し、orders#createで購入の記録をテーブルに保存するようにします。

# また、この購入機能は、商品情報にネストされることに気をつけましょう。パスは以下のように商品のidの後に購入についての処理が存在するようにします。




def index
    @orders == OrderSender.new
      # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
  end



  def create
      # binding.pryは処理に不要なので削除する
      # 値をDBへ保存する実装

    binding.pry
    @order = OrderSender.new(sender_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sender_params
    params.require(:order_sender).permit(:postal_code, :prefecture_id, :city, :detailed_address, :building, :tel).merge(user_id: current_user.id, item_id: current_item.id)
# requireに書きたいのはformオブジェクトの情報（２つの情報をまとめたいから）
    # permitはフォームから送られてくる内容を書く→今回は住所情報
# mergeで書く内容は外部情報を送りたい時に書く→今回は購入情報がorderの情報になるからordersテーブルに保存したい外部キーつまり、users とitemになる
  end


end
