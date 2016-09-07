class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  private

  def tally_cart_items

    @total = 0
    if cookies.permanent.encrypted.signed[:cart]
      contents = JSON.parse(cookies.permanent.encrypted.signed[:cart])
      contents.each do |id, quantity|
        @total += quantity.to_i
      end
    end
  end

end
