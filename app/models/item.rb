class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :product_description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_prefecture_id
    validates :scheduled_delivery_id
    validates :image
    validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
end
