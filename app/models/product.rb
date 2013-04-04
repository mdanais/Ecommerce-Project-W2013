class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price
  
  validates :category, :description, :name, :price, :presence => true
 #  belongs_to :invoice_item This association has to change. Products and Orders are associated through invoice items.
  
end
