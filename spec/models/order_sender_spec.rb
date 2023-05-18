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
        @order_sender.postal_code= ''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Postal code can't be blank")

      end
      it ' 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例:123-4567 良くない例:1234567）。' do
        @order_sender.postal_code='1234567'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること。' do
        @order_sender.prefecture_id= '0'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること。' do
        @order_sender.city=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること。' do
        @order_sender.detailed_address=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Detailed address can't be blank")
      end
      it '電話番号が必須であること。' do
        @order_sender.tel=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Tel can't be blank")        

      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例:09012345678 良くない例:090-1234-5678)' do
        @order_sender.tel='123456789234'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include('Tel is invalid. Maxlength: 11')
      end

      it "tokenが空では登録できないこと" do
        @order_sender.token =''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空だと登録できない" do
        @order_sender.user_id = nil
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("User can't be blank")

      end
      it "item_idが空だと登録できない" do
        @order_sender.item_id = nil
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("Item can't be blank")
      end

      


    end
  end
end


