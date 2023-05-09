class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item, :user

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :item
  validates :city
  validates :detailed_address


  def save
    # # 各テーブルにデータを保存する処理を書く
    # 寄付情報を保存し、変数donationに代入する
    # donation = Donation.create(price: price, user_id: user_id)
     # 注文情報を保存し、変数donationに代入する
    order = Order.create(item: item, user: user)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    # Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
    Sender.create(postal_code: postal_code, prefecture_id:prefecture_id, city:city, detailed_address:detailed_address, building:building, tel:tel,)
  
  end


end
