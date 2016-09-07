class AddProductIdToOrderedItem < ActiveRecord::Migration[5.0]
  def change
    add_column :ordered_items, :product_id, :integer
  end
end
