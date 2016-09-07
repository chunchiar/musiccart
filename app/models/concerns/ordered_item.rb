class OrderedItem < ActiveRecord::Base
  attr_accessible :products, :order_id, :quantity

  belongs_to :product
  belongs_to :order
end
