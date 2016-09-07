class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  def create
   @result = Braintree::Transaction.sale(
             amount: current_user.order_total_price,
             payment_method_nonce: params[:payment_method_nonce])
   if @result.success?
     current_user.purchase_order_products!
     redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
   else
     flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
     gon.client_token = generate_client_token
     render :new
   end
 end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  def check_cart!
    if current_user.ordered.items.blank?
      redirect_to root_url, alert: "Please add product to your cart before processing your transaction!"
    end
  end


end
