FactoryBot.define do
  factory :user do

   user = Gimei.name

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}


    iv_f_name { user.first.kanji }
    iv_l_name { user.last.kanji }
    iv_f_name_kana { user.first.katakana }
    iv_l_name_kana  { user.last.katakana }
    birthday               {Faker::Date.birthday}


  end
end


