class RemoveItemIdFromOrderedItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :ordered_items, :item_id, :integer
  end
end
