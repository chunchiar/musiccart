class AddIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :ordered_item_id, :integer
  end
end
