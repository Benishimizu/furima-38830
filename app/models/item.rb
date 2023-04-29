class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_description
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_term

    #空の投稿を保存できないようにする
    validates :title, :text, presence: true

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :genre_id, numericality: { other_than: 1 } 


    

end
