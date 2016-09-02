class Product < ApplicationRecord

  has_many :review, through: :ordered_item

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :sku, presence: true
  validates :brand, presence: true
  mount_uploader :image, ImageUploader

end
