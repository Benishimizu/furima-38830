require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      end
      it "nicknameが6文字以下で登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "nicknameが7文字以上であれば登録できない" do


        
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end




＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.password = ''  # passwordの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'お名前(全角)が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.iv_f_name = ''  # firstnameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Iv f name can't be blank"
    end

    it 'お名前(全角)(苗字）が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.iv_l_name = ''  # lastnameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Iv l name can't be blank"
    end

    it 'お名前カナ(全角)が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.iv_f_name_kana = ''  # firstname kanaの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Iv f name kana can't be blank"
    end

    it 'お名前カナ(全角)(苗字）が空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.iv_l_name_kana = ''  # lastnameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Iv l name kana can't be blank"
    end

    it 'Birthdayが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.birthday = ''  # passwordの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Birthday can't be blank"
    end

  end
end





・「パスワード」が英数字混合であること。


＝＝＝＝＝＝
・「名字・名前」が全角日本語であること
it 'お名前(全角)が全角日本語であること' do
  user = FactoryBot.build(:user)  # Userのインスタンス生成
  user.iv_f_name = ''  # firstnameの値を空にする
  user.valid?
  expect(user.errors.full_messages).to include "Iv f name can't be blank"
end


・「名字(カナ)・名前(カナ)」が全角カタカナであること。