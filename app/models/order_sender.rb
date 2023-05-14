class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item_id, :user_id
  # 上記の文でORDERSENDERで取り扱えるカラム（変数）を示している

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :item_id
    validates :city
  end
    # validates :detailed_address
    # テストコードstep7
    # OrderSEnderののバリデーションを見ながらテストコードを書くよ
    # テストに足りない情報があれば追加すればOK

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    # binding.pry
    Sender.create(postal_code: postal_code, prefecture_id:prefecture_id, city:city, detailed_address:detailed_address, building:building, tel:tel, order:order)
    #       t.references      :order, null: false, foreign_key: true
# が足りないだからsenderに保存ができない
# --> どうしたらいいかというと 上記のorderを利用して外部キーに値を入れたい

# そのために下記の様にすることが必要である　SMALLSTEP1
# # 寄付情報を保存し、変数donationに代入する
# donation = Donation.create(price: price, user_id: user_id)
# # 住所を保存する
# # donation_idには、変数donationのidと指定する
# Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
# end
# end


  
  end


end
