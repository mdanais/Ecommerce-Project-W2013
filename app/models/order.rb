class Order < ActiveRecord::Base
  attr_accessible :customer_id, :date, :subtotal, :pst_amount, :gst_amount, :hst_amount
  validates :customer_id, :presence => true
  
  belongs_to :customer
  has_many :invoice_items
end
