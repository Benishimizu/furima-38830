require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
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

