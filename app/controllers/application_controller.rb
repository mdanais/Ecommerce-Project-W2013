class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_cart
  
  
  protected
  def initialize_cart
      session['cart_items'] ||= []
      @items_in_cart = []
      
      session['cart_items'].each do |hash|
          @items_in_cart << {:product => Product.find(hash[:product_id].to_i), :qty => hash[:qty] }
      end
  
      
      if @items_in_cart.count > 0
      @cart_image = 'Shopping_Cart_Full.png'
      @cart_item_number = @items_in_cart.count
      else
      @cart_image = 'Shopping_Cart_Empty.png'
      @cart_item_number = 0
      
      end
  end

end
