require 'rails_helper'

RSpec.describe OrderSender, type: :model do
  describe '配送先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      
      user = FactoryBot.create(:user)
      @order_sender = FactoryBot.build(:order_sender,item_id: item.id,user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_sender).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_sender.building=''
        expect(@order_sender).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が必須であること。' do
        @order_sender.post_number= ''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Post number can't be blank", "Post number is invalid. Include hyphen(-)")

      end
      it ' 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例:123-4567 良くない例:1234567）。' do
        @order_sender.post_number='1234567'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること。' do
        @order_sender.region_id= ''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が必須であること。' do
        @order_sender.municipalities=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須であること。' do
        @order_sender.address=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること。' do
        @order_sender.phone_number=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")        

      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @order_sender.phone_number='123456789234'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Phone number is invalid.")
      end
      it "priceが空では保存ができないこと" do
        @order_sender.price =''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Price can't be blank")
      end
      # it "tokenが空では登録できないこと" do
      #   @order_sender.token =''
      #   @order_sender.valid?
      #   expect(@order_sender.errors.full_messages).to include("Token can't be blank")
      # end
    end
  end
end


### 試したこと

# ここに問題に対して試したことを記載してください。
# priceメソッドが定義されていないと思い
# order_sender.rbファイルにassociation
# をitemを記載しました。



# ここにより詳細な情報を記載してください。