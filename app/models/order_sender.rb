class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :item_id
    validates :city
    validates :detailed_address
    validates :tel, format:{with:/\A\d{10,11}\z/, message: "is invalid. Maxlength: 11"}
    validates :token

  end

    # テストコードstep7
    # OrderSEnderののバリデーションを見ながらテストコードを書くよ
    # テストに足りない情報があれば追加すればOK

          #   配送先情報
          # ?  配送先の住所情報も購入の都度入力させること。
          #  他機能関連
          #   売却済みの商品は、画像上に「sold out」の文字が表示されるようになっていること（商品一覧機能）。
          #   売却済みの商品は、画像上に「sold out」の文字が表示されるようになっていること（商品詳細機能）。
          #   ログイン状態の場合でも、売却済みの商品には、「商品の編集」「削除」「購入画面に進む」ボタンが表示されないこと（商品詳細機能）。
          #   ログイン状態の場合でも、自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること（商品情報編集機能）。
   
    # STEP８上記を再度確認する
    # Step９エラー解消
    # already purchased =>商品に紐づく商品の履歴が存在する＝＞ITEMに紐づくORDESテーブルに情報が入っている　つまり、ORDERSテーブルに入っているか確認すればいい



  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Sender.create(postal_code: postal_code, prefecture_id:prefecture_id, city:city, detailed_address:detailed_address, building:building, tel:tel, order:order)
  
  end


end
