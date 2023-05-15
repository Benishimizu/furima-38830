# ### 補足情報（FW/ツールのバージョンなど）
# order_sender.rb
FactoryBot.define do
  factory :order_sender do
    postal_code{"157-0076"}
    prefecture_id{5}
    city{"北区"}
    detailed_address{"青山1-1-1"}
    building{"牧野ビル"}
    tel{"09012190274"}
    item_id{1}
    # price {"3000"}
    # token {"tok_abcdefghijk00000000000000000"}
  end
end