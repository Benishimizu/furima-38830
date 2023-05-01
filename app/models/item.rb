class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_description
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_term


    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :item_description_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :shipping_term_id, numericality: { other_than: 1, message: "can't be blank" } 


    validates :item_name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :image, presence: true

    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

end
