class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item, :user
end

end
