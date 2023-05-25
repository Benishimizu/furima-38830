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
    validates :item_category_id, numericality: { other_than: 1, message: "が空では出品できない" } 
    validates :item_description_id, numericality: { other_than: 1, message: "が空では出品できない" }
    validates :shipping_fee_id, numericality: { other_than: 1, message: "が空では出品できない" }
    validates :prefecture_id, numericality: { other_than: 1, message: "が空では出品できない" }
    validates :shipping_term_id, numericality: { other_than: 1, message: "が空では出品できない" } 
  end

    validates :item_name, presence: true 
    validates :description, presence: true
    validates :price, presence: true
    validates :image, presence: true

    validates :price, numericality: {only_integer: true, message: 'は全角数値では出品できない'}

    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'を￥300以上￥10,000,000以下で設定してください' }



end
