class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    gon.client_token = generate_client_token
  end

  def create
    nonce = params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => "100.00",
      :payment_method_nonce => params[:payment_method_nonce]
    )

    if result.success?
        puts result.transaction.status
          flash[:notice] = "Transaction successful"
          redirect_to root_url
        else
          flash.now[:alert] = result.errors.to_json
          gon.client_token = generate_client_token
          render :new
        end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end


end
