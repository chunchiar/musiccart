class Product < ActiveRecord::Base
  rails_admin do
    list do
      sort_by :name
      field :name
      field :price
      field :description
      field :sku
      field :brand
    end
  end
end
