class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_description
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_term

    validates :title, :text, presence: true

    validates :item_category_id, numericality: { other_than: 1 } 
    validates :item_description_id, numericality: { other_than: 1 } 
    validates :shipping_fee_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :shipping_term_id, numericality: { other_than: 1 } 



end
