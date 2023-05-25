class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフンを含めた半角文字列のみ保存です"}
    validates :prefecture_id, numericality: {other_than: 1, message: "は必須です"}
    validates :item_id
    validates :city
    validates :detailed_address
    validates :tel, format:{with:/\A\d{10,11}\z/, message: "は登録できません."}
    validates :token

  end

  


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Sender.create(postal_code: postal_code, prefecture_id:prefecture_id, city:city, detailed_address:detailed_address, building:building, tel:tel, order_id:order.id)
  
  end


end
