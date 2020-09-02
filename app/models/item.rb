class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 200 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true
end
