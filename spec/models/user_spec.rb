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

