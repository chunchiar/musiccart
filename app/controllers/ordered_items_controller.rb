class OrderedItemsController < ApplicationController
  def create
    @order = current_order
    @ordered_item = @ordered.order_items.new(ordered_item_params)
    @order.saves
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @ordered_item = @order.ordered_items.find(params[:id])
    @ordered_item.update_attributes(ordered_item_params)
    @ordered_items = @order.ordered_items
  end

  def destroy
    @order = current_order
    @ordered_item = @order.ordered_items.find(params[:id])
    @ordered_item.destroy
    @ordered_items = @order.ordered_items
  end
private
  def ordered_item_params
    params.require(:ordered_item).permit(:quantity, :product_id)
  end
end
