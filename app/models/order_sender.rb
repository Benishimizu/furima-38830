class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item_id, :user_id, :token
  # 上記の文でORDERSENDERで取り扱えるカラム（変数）を示している

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :item_id
    validates :city
    validates :detailed_address
    validates :tel
    # validates :price
  end

    # テストコードstep7
    # OrderSEnderののバリデーションを見ながらテストコードを書くよ
    # テストに足りない情報があれば追加すればOK

          #   配送先情報
          # ?  配送先の住所情報も購入の都度入力させること。
          #   郵便番号が必須であること。
          #   郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。
          #   都道府県が必須であること。
          #   市区町村が必須であること。
          #   番地が必須であること。
          # ?  建物名は任意であること。
          #   電話番号が必須であること。
          #   電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。
          #  他機能関連
          #   売却済みの商品は、画像上に「sold out」の文字が表示されるようになっていること（商品一覧機能）。
          #   売却済みの商品は、画像上に「sold out」の文字が表示されるようになっていること（商品詳細機能）。
          #   ログイン状態の場合でも、売却済みの商品には、「商品の編集」「削除」「購入画面に進む」ボタンが表示されないこと（商品詳細機能）。
          #   ログイン状態の場合でも、自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること（商品情報編集機能）。
   
    # STEP８上記を再度確認する
    # Step９エラー解消



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
