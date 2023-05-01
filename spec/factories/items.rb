FactoryBot.define do
  factory :item do


        image         {Faker::Lorem.sentence}
        item_name          {"名前"}
        description    {"説明"}
        price           {2000}
        item_category_id  {1}
        item_description_id         {1}
        prefecture_id      {1}
        shipping_fee_id         {1}
        shipping_term_id        {1}

        association :user
    
        after(:build) do |message|
          message.image.attach(io: File.open('public/images/image001-1.png'), filename: 'image001-1.png')
        end

  end
end


