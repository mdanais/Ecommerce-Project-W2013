class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price
  validates :category, :description, :name, :price, :presence => true
 
  has_many :invoice_items #This association has to change. Products and Orders are associated through invoice items.
  
end
