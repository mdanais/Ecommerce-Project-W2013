class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_cart
  
  
  protected
  def initialize_cart
    session['cart_items'] ||= 0
    items_in_cart = session['cart_items']
    @in_cart_total = items_in_cart
    if @in_cart_total > 0
    @cart_image = 'Shopping_Cart_Full.png'
    else
    @cart_image = 'Shopping_Cart_Empty.png'
    end
  end
end
