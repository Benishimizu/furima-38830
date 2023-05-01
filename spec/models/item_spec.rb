require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it "登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上であれば登録できる" do
        @user.password = "0000ab"
        @user.password_confirmation = "0000ab"
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角であれば登録できる' do
        @user.iv_f_name = '桐生'
        @user.iv_l_name = 'アコ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角であれば登録できる' do
        @user.iv_f_name_kana = 'イオ'
        @user.iv_l_name_kana = 'イス'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "Birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "お名前(全角)が空では登録できない" do
        @user.iv_f_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv f name can't be blank")
      end
      it 'お名前(全角)が半角では登録できない' do
        @user.iv_f_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv f name 全角文字を使用してください")
      end

      it "お名前(全角)(苗字）が空では登録できない" do
        @user.iv_l_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name can't be blank")
      end
      it 'お名前(全角)(苗字）が半角では登録できない' do
        @user.iv_l_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name 全角文字を使用してください")
      end

      it "お名前カナ(全角)が空では登録できない" do
        @user.iv_f_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv f name kana can't be blank")
      end
      it 'お名前カナ(全角)が半角では登録できない' do
        @user.iv_f_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv f name 全角文字を使用してください")
      end
      it "お名前カナ(全角)(苗字）が空では登録できない" do
        @user.iv_l_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name kana can't be blank")
      end
      it 'お名前カナ(全角)(苗字が半角では登録できない' do
        @user.iv_l_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Iv l name 全角文字を使用してください")
      end



      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1234ab'
        @user.password_confirmation = '1234ab7'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = '000ab'
        @user.password_confirmation = '000ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = '0000a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end

        it 'passwordが数字だけだと登録できない' do
          @user.password ='11111111'
          @user.password_confirmation = '11111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'passwordが英字だけだと登録できない' do
          @user.password = 'aaaaaaaa'
          @user.password_confirmation = 'aaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'passwordが全角だと登録できない' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

   


    end
  end
end


#  ACTIVEHASHの時のvalidation 1,0に気をつける

#  画像；CHAT APPwosannsyou
end


ログイン状態の場合のみ、商品出品ページへ遷移できること。 #31
ログアウト状態の場合は、商品出品ページへ遷移しようとすると、ログインページへ遷移すること。 #19
商品画像を1枚つけることが必須であること。 #20
商品名が必須であること。 #21
商品の説明が必須であること。 #22
カテゴリーの情報が必須であること。 #23
カテゴリーは、「---、メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目が表示されること（--- は初期値として設定すること）。 #16
商品の状態の情報が必須であること。 #24
商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目が表示されること（--- は初期値として設定すること）。 #17
配送料の負担の情報が必須であること。 #25
配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目が表示されること（--- は初期値として設定すること）。 #18
発送元の地域の情報が必須であること。 #26
発送元の地域は、「---」と47都道府県の合計48項目が表示されること（--- は初期値として設定すること）。 #14
発送までの日数の情報が必須であること。 #27
発送までの日数は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目が表示されること（--- は初期値として設定すること）。 #15
価格の情報が必須であること。 #28
価格は、¥300~¥9,999,999の間のみ保存可能であること。 #29
価格は半角数値のみ保存可能であること。 #30
