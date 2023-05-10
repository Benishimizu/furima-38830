class Order < ApplicationRecord
 belongs_to :item presence:true
 belongs_to :user
 has_one:sender

end
