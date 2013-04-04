class InvoiceItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :taxes, :total
  validates :product_id, :quantity, :taxes, :total, :presence => true
  
  belongs_to :order
  has_many :products
  
end
