class Order < ApplicationRecord
  belongs_to :item
  belonsg_to :user
  has_one :address
  

end
