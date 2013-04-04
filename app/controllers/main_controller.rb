class MainController < ApplicationController
  
  def index
    #session['cart_items']
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

  end
  
  def about_us  
  
  end
  
  def services
  @products = Product.where("Category IN('Portrait','Rides', 'Sports')").order("category")

  end

def contact_us

end


def invoice_results
  @invoice_items =""
  @order = ""
  @customer = ""
  @products = Product.where("Category = 'Nature'")
end

end
