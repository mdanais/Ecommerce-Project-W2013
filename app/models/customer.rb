class Customer < ActiveRecord::Base
  attr_accessible :address, :first_name, :last_name, :postal_code, :province_id, :city, :email
end
