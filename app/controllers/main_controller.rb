class MainController < ApplicationController
    before_filter :initialize_cart
  
  
  
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
  @subtotal_invoice = 0.0
  @pst_amount_invoice = 0.0
  @gst_amount_invoice = 0.0
  @hst_amount_invoice = 0.0
  
  @grand_total_invoice = 0.0
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
  @subtotal_invoice = @subtotal_invoice + @invoice_item.total
  @invoice_item.save
end

@order_itmes_counter = @order.invoice_items.count
#variable customer.province.gst etc

@gst_amount_invoice = (@customer.province.gst / 100) * @subtotal_invoice
@pst_amount_invoice = (@customer.province.pst  / 100) * @subtotal_invoice
@hst_amount_invoice = (@customer.province.hst  / 100) * @subtotal_invoice

@grand_total_invoice = @subtotal_invoice + @pst_amount_invoice + @gst_amount_invoice + @hst_amount_invoice

#default time within sql table?????
@order.date = Time.new
@order.subtotal = @subtotal_invoice.round(2)
@order.pst_amount = @pst_amount_invoice.round(2)
@order.gst_amount = @gst_amount_invoice.round(2)
@order.hst_amount = @hst_amount_invoice.round(2)
@order.grand_total = @grand_total_invoice
@order.save

session['cart_items'] = []


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
