class Address < ApplicationRecord
  belongs_to :order
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone
  end
end
