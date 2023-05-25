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
        expect(@order_sender.errors.full_messages).to include("郵便番号を入力してください")

      end
      it ' 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例:123-4567 良くない例:1234567）。' do
        @order_sender.postal_code='1234567'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("郵便番号はハイフンを含めた半角文字列のみ保存です")
      end
      it '都道府県が必須であること。' do
        @order_sender.prefecture_id= '1'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("都道府県を入力してください")
      end
      it '市区町村が必須であること。' do
        @order_sender.city=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("市町村を入力してください")
      end
      it '番地が必須であること。' do
        @order_sender.detailed_address=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("住所詳細を入力してください")
      end
      it '電話番号が必須であること。' do
        @order_sender.tel=''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("電話番号を入力してください")        

      end
      it '電話番号は、半角数字以外が含まれている場合、登録できないこと' do
        @order_sender.tel='123456789２s'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include('電話番号は登録できません')
      end
      it '電話番号は、9桁以下では登録できないこと' do
        @order_sender.tel='12345678'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include('電話番号は登録できません')
      end
      it '電話番号は、12桁以上では登録できないこと' do
        @order_sender.tel='1234567891234'
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include('電話番号は登録できません')
      end


      it "tokenが空では登録できないこと" do
        @order_sender.token =''
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("トークンを入力してください")
      end

      it "user_idが空だと登録できない" do
        @order_sender.user_id = nil
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("ユーザー名を入力してください")

      end
      it "item_idが空だと登録できない" do
        @order_sender.item_id = nil
        @order_sender.valid?
        expect(@order_sender.errors.full_messages).to include("商品を入力してください")
      end

      


    end
  end
end


