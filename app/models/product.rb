class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_items
  has_many :orders, through: :ordered_items

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :sku, presence: true
  validates :brand, presence: true
  mount_uploader :image, ImageUploader

  def total_price
    total_price = 0
    product.price * product.q
    total_price
  end

end
