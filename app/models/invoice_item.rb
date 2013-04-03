class InvoiceItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :taxes, :total
end
