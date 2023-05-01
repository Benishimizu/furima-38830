require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end



  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do

      it "登録できる" do
        expect(@item).to be_valid
      end

    end

    context '商品登録がうまくいかないとき' do
      it "商品画像が空だと登録できない" do
        # @user.nickname = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "商品名が空では登録できない" do
        # @user.email = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "商品の説明が空では登録できない" do
        # @user.password = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "カテゴリーの情報が空では登録できない" do
        # @user.birthday = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "配送料の負担の情報が空では登録できない" do
        # @user.iv_f_name = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Iv f name can't be blank")
      end

      it "発送元の地域の情報が空では登録できない" do
        # @user.iv_l_name = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Iv l name can't be blank")
      end

      it "発送までの日数の情報が空では登録できない" do
        # @user.iv_f_name_kana = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Iv f name kana can't be blank")
      end


      it "価格の情報が空では登録できない" do
        # @user.iv_f_name_kana = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Iv f name kana can't be blank")
      end



      it '価格は全角数値では登録できない' do
        @user.iv_l_name = '１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name 全角文字を使用してください")
      end

      it '価格が￥299以下では登録できない' do
        @user.iv_f_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv f name 全角文字を使用してください")
      end
      it "価格が￥10,000,000以上では登録できない" do
        @user.iv_l_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name kana can't be blank")
      end


    end
  end
end


#  ACTIVEHASHの時のvalidation 1,0に気をつける

#  画像；CHAT APPwosannsyou
end

