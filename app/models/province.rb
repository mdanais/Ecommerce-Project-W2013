class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  validates :name, :presence => true
  
  has_many :customers
end
