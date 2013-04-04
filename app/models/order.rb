class Order < ActiveRecord::Base
  attr_accessible :customer_id, :date
  validates :customer_id, :date, :presence => true
  
  belongs_to :customer
  has_many :invoice_items
end
