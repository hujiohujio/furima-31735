class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :product_description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shipping_fee_id, numericality: { other_than: 1 }
    validates :shipping_prefecture_id, numericality: { other_than: 1 }
    validates :scheduled_delivery_id, numericality: { other_than: 1 }
    validates :image
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_prefecture
  belongs_to :scheduled_delivery
end
