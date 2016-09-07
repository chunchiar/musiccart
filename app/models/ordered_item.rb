class OrderedItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  has_many :comment

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize
end
