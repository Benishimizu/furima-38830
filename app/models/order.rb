class Order < ApplicationRecord
  belongs_to :item 
  belongs_to :user
  has_one :sender
  validates :token, presence: true


end
