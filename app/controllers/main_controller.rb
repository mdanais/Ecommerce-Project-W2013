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
  @customer = Customer.find(params[:id])
  #customer has many orders that must be build
  @order = @customer.orders.build
  @order.save
  

  
  @items_in_cart.each do |item|
  @invoice_item = @order.invoice_items.build
  @invoice_item.product = item[:product]
  @invoice_item.quantity = item[:qty]
  @invoice_item.taxes = item[:product].price
  @invoice_item.total = @invoice_item.quantity * @invoice_item.taxes
  #create a subtotal here Do migrations to add collums
  @invoice_item.save
end
 #add the total to the subtotal value
 #variable customer.province.gst etc
 #order.save

end

def cart

end

def add_to_cart
  index_num = 0
  found = false
  
  session['cart_items'].each_with_index do |hash, index|
    if hash[:product_id] == params[:product_id]
      index_num = index
      found = true
    end
  end
  
  
  
  
  if found
    #increment the qty
    session['cart_items'][index_num][:qty] += 1
  
  else
  #create a entry of hashes
  session['cart_items'] << {:product_id => params[:product_id], :qty => 1}
    
  end
  redirect_to products_path
end

def delete_from_cart
  index_num = 0
  found = false
  
  session['cart_items'].each_with_index do |hash, index|
    if hash[:product_id] == params[:product_id]
      index_num = index
      found = true
    end
  end
  
  
  
  
  if found
    #increment the qty
    session['cart_items'].delete_at(index_num)
  end

  redirect_to cart_path
end


def clear_cart
  session['cart_items'] = []
  redirect_to products_path
end

def customer_information
@customer = Customer.new
@provinces = Province.all
@order = Order.new

end

end#End of class
