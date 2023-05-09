class OrderSender
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detailed_address, :building, :tel, :item, :user

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :item
  validates :city
  validates :detailed_address


end
