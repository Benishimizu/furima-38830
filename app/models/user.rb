class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         validates :nickname, presence: true
         validates :iv_f_name, presence: true
         validates :iv_l_name, presence: true
         validates :iv_f_name_kana, presence: true
         validates :iv_l_name_kana, presence: true
         validates :birthday, presence: true
         

end
