class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_description
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_term

  with_options presence: true do
    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :item_description_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_term_id, numericality: { other_than: 1, message: "can't be blank" } 
  end

    validates :item_name, presence: true, allow_blank: true
    validates :description, presence: true, allow_blank: true
    validates :price, presence: true, allow_blank: true
    validates :image, presence: true, allow_blank: true

    validates :price, numericality: {only_integer: true, message: 'Half-width number'}

    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }




end
