class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

          with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
            validates :iv_f_name
            validates :iv_l_name
          end
          with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' } do
            validates :iv_f_name_kana
            validates :iv_l_name_kana
          end


         validates :nickname, presence: true
         validates :birthday, presence: true
         has_many :items

end
