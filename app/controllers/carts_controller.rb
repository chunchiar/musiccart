class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_cart_contents
  respond_to :js

  def add_item
    if @cart_contents
      contents = JSON.parse(@cart_contents)
      contents[product_id] = contents[product_id].to_i + quantity.to_i
    else
      contents = { product_id => quantity }
    end

    cookies.permanent.encrypted.signed[:cart] = JSON.generate(contents)
    tally_cart_items
  end

  def update_item
    @product = Product.find_by(id: params[:id])

    contents = JSON.parse(@cart_contents)
    contents[params[:id]] = params[:quantity]
    cookies.permanent.encrypted.signed[:cart] = JSON.generate(contents)
    @line_price = params[:quantity].to_i * @product.price
    tally_cart_items
  end

  def remove_item
    contents = JSON.parse(@cart_contents)
    contents.delete(product_id)

    if contents.empty?
      cookies.delete(:cart)
    else
      cookies.permanent.encrypted.signed[:cart] = JSON.generate(contents)
    end
    @deletable_id = product_id
    tally_cart_items
  end

  def show
    @total = 0
    @products = []

    if @cart_contents
      cart = JSON.parse(@cart_contents)
      if !cart
        return
      end

      cart.each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        if !product
          next
        end
        product.define_singleton_method(:quantity) do
          quantity
        end
        @total += product.price * quantity.to_i
        @products << product
      end
    end
  end

  private

  def current_user_order
    "order#{current_user.id}"
  end

  def retrieve_cart_contents
    @cart_contents = cookies.permanent.encrypted.signed[:cart]
  end

  def product_id
    params[:id]
  end

  def quantity
    params[:quantity]
  end


end

#Your routes:
# get :cart, to: "carts#show"
# post :add_item, to: "carts#add_item"
# post :remove_item, to: "carts#remove_item"

#In your views, create a simple form that sends 2 parameters to your carts controller, the item id and the item quantity.
#Use hash [delete](https://ruby-doc.org/core-1.9.3/Hash.html#method-i-delete) to delete key / value pairs from your hash.
#Be sure to encrypt and sign your cookies (refer to `shopping cart and cookies`)
#Read about `define_singleton_method` [here](http://apidock.com/ruby/Object/define_singleton_method)
