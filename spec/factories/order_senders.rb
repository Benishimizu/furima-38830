# ### 補足情報（FW/ツールのバージョンなど）
# order_sender.rb
FactoryBot.define do
  factory :order_sender do
    post_number{"157-0076"}
    region_id{5}
    municipalities{"北区"}
    address{"青山1-1-1"}
    building{"牧野ビル"}
    phone_number{"09012190274"}
    order_id{1}
    price {"3000"}
    # token {"tok_abcdefghijk00000000000000000"}
  end
end