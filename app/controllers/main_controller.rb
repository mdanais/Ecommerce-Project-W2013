class MainController < ApplicationController
  
  def index
    @photo_array = Array.new
    @products = Product.where("Category IN('Nature','Landscape', 'Town & Country')")
    
    @products.each do |product|
      @photo_array << product
    end
    
    @count_product = @photo_array.count
    @random_number1 = rand(1..@count_product)
    @product = @photo_array[@random_number1]
    
    @service_array = Array.new
    @sevice_products = Product.where("Category IN('Sports','Portrait', 'Rides')")
    
    @sevice_products.each do |product|
      @service_array << product
    end
    
    @count_service_product = @service_array.count
    @random_number2 = rand(1..@count_service_product)
    @service_product = @service_array[@random_number2]
    
    @in_cart_total = 1
    if @in_cart_total > 0
    @cart_image = 'Shopping_Cart_Full.png'
    else
    @cart_image = 'Shopping_Cart_Empty.png'
    end

  end
  
  def about_us
    @in_cart_total = 0
    if @in_cart_total > 0
    @cart_image = 'Shopping_Cart_Full.png'
    else
    @cart_image = 'Shopping_Cart_Empty.png'
  end
  
  
  end
  
  def services
  @products = Product.where("Category IN('Portrait','Rides', 'Sports')").order("category")
  
      @in_cart_total = 0
    if @in_cart_total > 0
    @cart_image = 'Shopping_Cart_Full.png'
    else
    @cart_image = 'Shopping_Cart_Empty.png'
    end
  
  end

def contact_us
  
      @in_cart_total = 0
    if @in_cart_total > 0
    @cart_image = 'Shopping_Cart_Full.png'
    else
    @cart_image = 'Shopping_Cart_Empty.png'
    end
  
end


def invoice_results
  @invoice_items =""
  @order = ""
  @customer = ""
  @products = Product.where("Category = 'Nature'")
end

end
