class Customer < ActiveRecord::Base
  attr_accessible :address, :first_name, :last_name, :postal_code, :province_id, :city, :email
  validates :address, :first_name, :last_name, :postal_code, :province_id, :city, :email, :presence => true
  
  
  belongs_to :province
  has_many :orders
end
